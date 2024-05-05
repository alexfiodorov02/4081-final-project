class FollowsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      user = User.find(params[:followed_id])
      current_user.following << user
      redirect_to user_profile_path(user)
    end
  
    def destroy
      user = Follow.find(params[:id]).followed
      current_user.following.delete(user)
      redirect_to user_profile_path(user)
    end
end
  