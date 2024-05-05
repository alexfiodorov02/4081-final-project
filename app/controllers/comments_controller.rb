class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to_commentable_with_notice
    else
      redirect_to_commentable_with_alert
    end
  end

  def destroy
    @comment.destroy
    redirect_to_commentable_with_notice('Comment was successfully deleted.')
  end

  private

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Item not found.'
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def redirect_to_commentable_with_notice(notice = 'Comment was successfully created.')
    redirect_to polymorphic_path(@commentable), notice: notice
  end

  def redirect_to_commentable_with_alert(alert = 'Failed to create comment.')
    redirect_to polymorphic_path(@commentable), alert: alert
  end
end
