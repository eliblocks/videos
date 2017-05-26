class SessionsController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  def new
    redirect_to '/auth/facebook'
  end

  def create
    @auth = request.env['omniauth.auth']
    if User.find_by(email: @auth.info.email)
      @user = User.find_by(email: @auth.info.email)
      @user.process(@auth)
    else
      @user = User.new
      @user.process(@auth)
    end
    @user.save
    reset_session
    session[:user_id] = @user.id
    redirect_to root_url
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def vimeo
    @token = request.env['omniauth.auth'][:credentials][:token]
    @vimeo_id = request.env['omniauth.auth'][:uid]
    session[:vimeo_token] = @token
    session[:vimeo_id] = @vimeo_id
    current_user.update!(vimeo_token: @token, vimeo_id: @vimeo_id)
    Video.update_vimeo_videos(current_user, @token, @vimeo_id)
    redirect_to manage_videos_path
  end
end
