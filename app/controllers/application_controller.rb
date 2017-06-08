class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user
  helper_method :logged_in?

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def authenticate_user
    redirect_to login_path unless logged_in?
  end

  def authorize
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_url
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
