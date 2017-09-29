class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:account]

  def index
    @users = User.uploaders
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @videos = all_or_approved_videos(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Account Updated"
      redirect_to '/account'
    else
      render 'edit'
    end
  end


  def account
    @user = current_user
    @minutes_used_last_30 = current_user.minutes_used_last_30
    @most_watched_courses = current_user.most_watched_courses(10)
    @most_watched_uploaders = current_user.most_watched_uploaders(10)
  end

  private

  def user_params
    params.require(:user).permit(:paypal_email, :full_name)
  end

  def all_or_approved_videos(user)
    user == current_user ? user.videos : user.videos.approved
  end
end
