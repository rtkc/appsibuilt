class UsersController < ApplicationController 

  before_action :set_user, only: [:edit, :update, :show]
  before_action :account_owner_access_only, only: [:edit, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'You have successfully signed up'
      redirect_to root_path
    else 
      flash[:error] = 'Please input valid username and password'
      render :new
    end
  end

  def show
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = current_user

    if @user.save(user_params)
      flash[:notice] = 'Your app was successfully updated.'
      redirect_to user_path(@user)
    else 
      flash[:error] = 'Something went wrong. Please try updating your app again'
      render :edit
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:username, :email, :time_zone, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end