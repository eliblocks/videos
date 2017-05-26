class UsersController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def manage_videos
    @videos = current_user.videos
  end
end
