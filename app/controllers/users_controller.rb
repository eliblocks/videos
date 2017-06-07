class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
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
end
