class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user
  helper_method :logged_in?
  helper_method :link_id

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def authenticate_user
    unless logged_in?
      flash[:danger] = "Must be logged in to perform that action"
      redirect_to root_url
    end
  end

  def get_vimeo_video(user)

  end

  def link_id(element)
    element["uri"].gsub("/videos/", "")
  end
end
