class SessionsController < ApplicationController
  def new
  end

  def create
    # Find User:
    @user = User.find_by(username: params[:session][:username])
    # Authenticate:
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # either user doesn't exist or password is incorrect
    # Redirect
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
