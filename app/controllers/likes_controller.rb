class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable

  def create
    @like = current_user.likes.new(likeable: @likeable)

    if @like.save
      redirect_back fallback_location: [@likeable], notice: 'You sweeted this post!'
    else
      redirect_back fallback_location: [@likeable], alert: 'Unable to sweet this.'
    end
  end

  def destroy
    @like = @likeable.likes.find_by(user: current_user)
    if @like&.destroy
      redirect_back fallback_location: [@likeable], notice: 'You unsweeted this post.'
    else
      redirect_back fallback_location: [@likeable], alert: 'Unable to unsweet this.'
    end
  end

  private

  def set_likeable
    klass = [Post, Fork].find do |c|
      params["#{c.name.underscore}_id"].present?
    end
    @likeable = klass.find(params["#{klass.name.underscore}_id"])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "#{klass.name} not found."
  end
end
