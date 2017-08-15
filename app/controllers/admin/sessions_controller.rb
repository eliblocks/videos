class Admin::SessionsController < Admin::AdminController
  def index
  end

  def impersonate
    reset_session
    @user = User.find(params[:id])
    session[:user_id] = @user.id
    redirect_to root_url
  end


end
