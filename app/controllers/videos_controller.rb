require 'wistia'
Wistia.password = ENV['WISTIA_SECRET_KEY']

class VideosController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @videos = Video.approved.order(seconds_viewed: :desc).page(params[:page]).per(5)
  end

  def show
    @video = Video.find(params[:id])
    if !logged_in?
      flash[:danger] = "You need to be logged in to watch videos"
      redirect_to root_url
    elsif current_user.balance < @video.length_in_seconds
      flash[:danger] = "You don't have enough minutes to view this video"
      redirect_to root_url
    else
      @play = Play.new
    end
  end

  def new
    @section = Section.find(params[:section_id])
    @show = @section.show
    @video = @section.videos.new

    if Rails.env == 'development'
      @project = 'ma2vo0l9bd'
    elsif Rails.env == 'production'
      @project = '9hyra9x33g'
    elsif Rails.env == 'test'
      @project == 'ma2vo0l9bd'
    end
  end

  def create
    @section = Section.find(params[:video][:section_id])
    @video = @section.videos.new(video_params)
    @video.user = current_user
    if @video.save
      flash[:success] = "Video successfully submitted"
      flash[:info] = "Video will be public once it has been approved. Since this app is currently in testing phase, you can approve your own video by visiting /admin."
      redirect_to section_path(@section)
    else
      render 'new'
    end
  end

  def edit
    @video = Video.find(params[:id])
    @section = @video.section
    @show = @video.section.show
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      flash[:success] = "Video updated"
      redirect_to section_path(@video.section)
    else
      render 'edit'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:success] = "Video Deleted"
    redirect_to section_path(@video.section)
  end

  def search
    @query = params[:q]
    @videos = Video.algolia_search(@query)
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
