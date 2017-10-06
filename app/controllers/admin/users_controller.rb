class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.order(:id)
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "User updated"
      redirect_to admin_users_url
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = @user.password_confirmation = params[:user][:password]
    @user.confirmed_at = Time.now

    if @user.save
      flash[:success] = "User Created"
      redirect_to admin_users_url
    else
      debugger
      puts @user.errors.full_messages
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :facebook_id, :image, :password)
  end

end
