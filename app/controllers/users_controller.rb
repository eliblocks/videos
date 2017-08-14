class UsersController < ApplicationController
  before_action :authorize, only: [:account]

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

  def last_days
    ((Time.now - current_user.last_purchase.created_at) / 86400).round
  end

  def minutes_used
    current_user.spent_since_last_purchase / 60
  end

  def account
    @user = current_user
    @last_days = last_days
    @minutes_used = minutes_used
    @most_watched_videos = @user.most_watched_videos(10)
    @most_watched_uploaders = @user.most_watched_uploaders(10)
  end

  private

  def user_params
    params.require(:user).permit(:paypal_email)
  end

  def all_or_approved_videos(user)
    user == current_user ? user.videos : user.videos.approved
  end
end
