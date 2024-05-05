class ForksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_fork, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.find(params[:post_id])
    @fork = Fork.new
  end

  def show
    @fork = Fork.includes(:tags).find(params[:id])
    @parent = @fork
    @commentable = @fork
    @comment = Comment.new
    render :show
  end

  def create
    @post = Post.find(params[:post_id])
    @fork = current_user.forks.build(fork_params)
    @fork.post = @post
    handle_tags(@fork, tag_params)
    if @fork.save
      redirect_to post_fork_path(@post, @fork), notice: 'Recipe forked successfully.'
    else
      render :new, alert: 'Failed to create new post from forked recipe.'
    end
  end

  def edit
  end

  def update
    handle_tags(@fork, tag_params)
    if @fork.update(fork_params)
      redirect_to [@fork.post, @fork], notice: 'Fork was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @fork.destroy
    redirect_to posts_path, notice: 'Fork was successfully deleted.'
  end

  private

  def set_fork
    @fork = Fork.includes(:tags).find(params[:id])
  end

  def fork_params
    params.require(:fork).permit(:title, :description, :ingredients, :directions, :image)
  end

  def tag_params
    params.require(:fork).permit(:meal_tags, :difficulty_tags, :cuisine_tags, :dietary_tags)
  end

  def handle_tags(fork, tag_params)
    %w[meal difficulty cuisine dietary].each do |category|
      tag_names = (tag_params["#{category}_tags"] || '').split(',').map(&:strip).uniq
      current_tags = fork.tags.where(category: category).pluck(:name)

      # Remove old tags
      (current_tags - tag_names).each do |old_name|
        old_tag = Tag.find_by(name: old_name, category: category)
        fork.tags.delete(old_tag) if old_tag
      end

      # Add new tags
      (tag_names - current_tags).each do |new_name|
        new_tag = Tag.find_or_create_by(name: new_name, category: category)
        fork.tags << new_tag unless fork.tags.include?(new_tag)
      end
    end
  end
end
