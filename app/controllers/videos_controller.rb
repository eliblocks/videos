class VideosController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  def index
    @videos = Video.all

  end

  # def new
  #   @videos = []
  #   if current_user.vimeo_token && current_user.vimeo_id && session[:vimeo_id] && session[:vimeo_token]
  #     address = "https://api.vimeo.com/users/#{session[:vimeo_id]}/videos"
  #     response = HTTParty.get(address, headers: { "Authorization" => "Bearer #{session[:vimeo_token]}" })
  #     @data = JSON.parse(response.body)["data"]
  #     @data.each do |data|
  #       @video = Video.new(title: data["name"],
  #         user_id: current_user.id,
  #         length_in_seconds: data["duration"],
  #         vimeo_id: link_id(data),
  #         description: data['description'],
  #         thumbnail_url: data['pictures']['sizes'][2]['link'])
  #       @videos << @video
  #     end
  #   end
  # end

  def show

  end

  def create
    params[:selections].each do |id, value|
      address = "https://api.vimeo.com/videos/#{id}"
      data = HTTParty.get(address, headers: { "Authorization" => "Bearer #{session[:vimeo_token]}" })
      data = JSON.parse(data.body)
      @video = Video.new(title: data["name"],
                          user_id: current_user.id,
                          length_in_seconds: data["duration"],
                          vimeo_id: id,
                          description: data['description'],
                          thumbnail_url: data['pictures']['sizes'][2]['link'])
      unless @video.save!
        debugger
      end
    end
    params[:video_id].each_with_index |vid, index|

    end
    redirect_to root_url
  end

  def vimeo
    @token = current_user.vimeo_token
  end



  private

  def video_params
    params.require(:video).permit(:title, :description, :length_in_seconds, :wistia_id)
  end
end
