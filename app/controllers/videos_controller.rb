require 'wistia'
Wistia.password = ENV['WISTIA_SECRET_KEY']

class VideosController < ApplicationController

  def index
    @videos = Video.where(approved: true)

    if logged_in?
      @videos = @videos.select { |vid| vid.approved || vid.user.id == current_user.id }
    else
      @videos = Video.where(approved: true)
    end

  end

  def show
    @video = Video.find(params[:id])
    @play = Play.new
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
      flash[:info] = "Video will be public once it has been approved. Since this app is currently in testing phase, you can approve your own video by visiting /admin."
      redirect_to root_url
    else
      flash[:danger] = @video.errors.full_messages
      render 'new'
    end
  end

  def search
    @videos = Video.all
    render 'index'
  end

  private

  def video_params
    params.require(:video).permit(:title,
                                  :description,
                                  :length_in_seconds,
                                  :wistia_id,
                                  :wistia_delivery_id)
  end
end
