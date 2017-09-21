class PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @video = Video.find(params[:play][:video_id])
    Play.create!(play_params)
    current_user.subtract_balance!(seconds)
    @video.user.add_balance!(seconds)
    @video.add_seconds_viewed(seconds)
    @video.section.add_seconds_viewed(seconds)
    @video.section.course.add_seconds_viewed(seconds)
    head :ok
  end

  private

  def play_params
    params.require(:play).permit(:user_id, :video_id, :length_in_seconds)
  end

  def seconds
    params[:play][:length_in_seconds].to_i
  end

end

