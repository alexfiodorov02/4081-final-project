class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :authorize_user, only: [:edit, :update] 
  
    def show
        @profile = @user.profile
        @business = @user.business
        unless @profile
          redirect_to root_path, alert: "User profile not found."
        end
    end
  
    def edit
      @profile = @user.profile || @user.build_profile
    end
  
    def update
      @profile = @user.profile || @user.build_profile
      if @profile.update(profile_params)
        redirect_to user_profile_path(@user), notice: 'Profile updated successfully.'
      else
        render :edit
      end
    end

    def cookbook
      @favorites = current_user.favorites.includes(favoritable: :post)
    end
  
    private
  
    def set_user
        @user = User.find_by(id: params[:user_id])
        unless @user
          flash[:alert] = "User not found."
          redirect_to root_path
        end
    end
  
    def profile_params
      params.require(:profile).permit(:name, :bio)
    end
  
    def authorize_user
      @user = User.find(params[:user_id])
      unless current_user == @user
        redirect_to root_path, alert: "You are not authorized to perform this action."
      end
    end
  end
  

  