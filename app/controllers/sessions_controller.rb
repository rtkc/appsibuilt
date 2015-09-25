class SessionsController < ApplicationController #Solution: Lesson 3, Authentication

  def new; end

  def create
   user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:notice] = 'You have logged in successfully'
      redirect_to root_path
    else
      flash[:error] = 'The username or password you entered was incorrect. Please try again.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end
end