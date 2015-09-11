class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "User has been created."
    else
      flash.now[:alert] = "User has not been created"
      render "new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
