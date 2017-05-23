require 'wistia'
Wistia.password = ENV['WISTIA_SECRET_KEY']

class VideosController < ApplicationController

  def index
    @videos = Video.all

  end

  def new
    @video = Video.new
    @password = ENV['WISTIA_SECRET_KEY']
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      flash[:success] = "Video successfully submitted"
      redirect_to root_url
    else
      flash[:danger] = @video.errors.full_messages
      render 'new'
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :length_in_seconds, :wistia_id)
  end
end
