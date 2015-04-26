class SessionsController < ApplicationController
  def new
  end

   def create
    user = User.find_by(email: params[:login][:email])

    if user && user.authenticate(params[:login][:password]) 
      session[:user_id] = user.id.to_s
      redirect_to users_path
    else
      # flash wrong login message
      flash.now[:error] = "wrong login credentials"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
