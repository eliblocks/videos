require 'wistia'
Wistia.password = ENV['WISTIA_SECRET_KEY']

class VideosController < ApplicationController
  before_action :authorize, only: [:new, :create]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.approved.order(seconds_viewed: :desc).page(params[:page]).per(8)
  end

  def show
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
    if params[:section_id]
      @section = Section.find(params[:section_id])
      @course = @section.course
      @video = @section.videos.new
    else
      @video = Video.new
    end

    if Rails.env == 'development'
      @project = 'ma2vo0l9bd'
    elsif Rails.env == 'production'
      @project = '9hyra9x33g'
    elsif Rails.env == 'test'
      @project == 'ma2vo0l9bd'
    end
  end

  def create
    if params[:video][:section_id]
      @section = Section.find(params[:video][:section_id])
      @video = @section.videos.new(video_params)
    else
      @video = Video.new(video_params)
    end

    @video.user = current_user
    @video.image = @video.thumbnail_url
    if @video.save
      flash[:success] = "Video successfully submitted for approval"
      if @video.section
        redirect_to section_path(@section)
      else
        redirect_to root_url
      end
    else
      render 'new'
    end
  end

  def edit
    @section = @video.section
    @course = @video.section.course
  end

  def update
    if @video.update_attributes(video_params)
      flash[:success] = "Video updated"
      redirect_to section_path(@video.section)
    else
      render 'edit'
    end
  end

  def destroy
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

  def set_video
    @video = Video.find(params[:id])
  end
end
