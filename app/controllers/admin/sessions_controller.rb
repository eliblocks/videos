class Admin::SessionsController < Admin::AdminController
  def index
  end

  def impersonate
    reset_session
    @user = User.find(params[:id])
    sign_in @user
    redirect_to root_url
  end


end
