class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # signs user auto after signup
      session[:user_id] = @user.id.to_s
      # flash sign in message. applications.html.erb
      flash[:welcome] = "Thanks for signing up, #{@user.name}!"
      redirect_to jobs_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :clinic_name, :registration_number)
  end
end
