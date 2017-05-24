class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def manage_videos

  end
end
