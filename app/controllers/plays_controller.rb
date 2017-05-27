class PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Play.create(user: current_user, video_id: 1, length_in_seconds: 5)
  end
end

