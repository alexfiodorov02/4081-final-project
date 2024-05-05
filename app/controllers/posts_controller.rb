class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search].present?
      tag = Tag.where('name ILIKE ?', "%#{params[:search]}%").first
      posts = tag ? Post.joins(:tags).where(tags: { id: tag.id }) : Post.none
      forks = tag ? Fork.joins(:tags).where(tags: { id: tag.id }) : Fork.none

      # Now searching for post titles, descriptions, ingredients, and directions
      search_term = "%#{params[:search]}%"
      posts = posts.or(Post.where('title ILIKE :search OR description ILIKE :search OR ingredients ILIKE :search OR directions ILIKE :search', search: search_term))
    else
      posts = Post.all.includes(:likes, :user)
      forks = Fork.all.includes(:user)
    end

    @items = (posts + forks).sort_by(&:created_at).reverse

    if params[:sort_by] == 'date'
      @items.sort_by!(&:created_at).reverse!
    elsif params[:sort_by] == 'likes'
      @items.sort_by! { |item| item.respond_to?(:likes) ? item.likes.size : 0 }.reverse!
    end

    render :index
  end


  def show
    @post = Post.find(params[:id])
    @parent = @post
    @commentable = @post
    @comment = Comment.new
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.build(post_params)
    handle_tags(@post, tag_params)
    if @post.save
      flash[:success] = 'Blog post was successfully created.'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'Unable to create blog post.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    handle_tags(@post, tag_params)
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated.'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'Unable to update post.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post was successfully deleted.'
    redirect_to posts_url
  end

  def fork
    @post = Post.find(params[:id])
    @fork = current_user.forks.build(post: @post)
    if @fork.save
      redirect_to @fork, notice: 'Recipe forked successfully.'
    else
      redirect_to @post, alert: 'Failed to fork the recipe.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :ingredients, :directions, :image)
  end

  def tag_params
    params.require(:post).permit(:meal_tags, :difficulty_tags, :cuisine_tags, :dietary_tags)
  end

  def handle_tags(post, tag_params)
    %w[meal difficulty cuisine dietary].each do |category|
      tag_names = tag_params["#{category}_tags"].to_s.split(',').map(&:strip).uniq
      current_tags = post.tags.where(category: category).pluck(:name)

      # Remove old tags
      (current_tags - tag_names).each do |old_name|
        old_tag = Tag.find_by(name: old_name, category: category)
        post.tags.delete(old_tag) if old_tag
      end

      # Add new tags
      (tag_names - current_tags).each do |new_name|
        new_tag = Tag.find_or_create_by(name: new_name, category: category)
        post.tags << new_tag unless post.tags.include?(new_tag)
      end
    end
  end
end
