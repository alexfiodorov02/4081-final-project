class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :set_business, only: [:edit, :update, :show, :destroy]

  def show
    @business 
  end

  def new
    @business = Business.new
  end


  def create
    @user = User.find(params[:user_id])
    @business = @user.build_business(business_params)
    if @business.save
      redirect_to user_business_path(@user), notice: 'Business page created successfully.'
    else
      flash.now[:alert] = @business.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end
  

  def update
    if @business.update(business_params)
      redirect_to user_business_path(@user), notice: 'Business page updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to user_profile_path(@user), notice: 'Business page successfully deleted.'
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_business
    @business = Business.find_by(user_id: params[:user_id])
    unless @business
      redirect_to root_path, alert: "Business page not found."
    end
  end

  def business_params
    params.require(:business).permit(:name, :address, :restaurant_type, :bio, :menu)
  end
end

