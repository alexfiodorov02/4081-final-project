class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favoritable

  def create
    @favorite = current_user.favorites.build(favoritable: @favoritable)

    if @favorite.save
      redirect_to [@favoritable], notice: 'You added this to your cookbook.'
    else
      redirect_to [@favoritable], alert: 'Unable to add to your cookbook.'
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id], user: current_user)
    if @favorite&.destroy
      redirect_back(fallback_location: root_path, notice: 'You removed this from your cookbook.')
    else
      redirect_back(fallback_location: root_path, alert: 'Unable to remove from your cookbook.')
    end
  end

  private

  def set_favoritable
    resource, id = request.path.split('/')[1, 2]
    @favoritable = resource.singularize.classify.constantize.find(id)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Item not found.'
  end
end
