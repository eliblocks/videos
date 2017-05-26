class VideosController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  def index
    @videos = Video.displayable
  end

  def new
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
  end

  def update_status
    video_ids = params[:videos].try(:keys)
    video_ids ||= []
    video_ids.each do |id|
      Video.find(id).update!(displayable: true)
    end
    current_user.videos.each do |video|
      video.update!(displayable: false) unless video_ids.include?(video.id.to_s)
    end
    redirect_to root_url
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :length_in_seconds, :wistia_id)
  end
end
