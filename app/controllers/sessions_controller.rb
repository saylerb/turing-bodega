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
      flash.now[:alert] = "Invalid. Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Goodbye!"
    redirect_to login_path
  end

end
