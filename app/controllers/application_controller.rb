class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_user, :account_owner_access_only

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #current_user method
  end

  def require_user
    if !logged_in?
      flash[:error] = 'You need to be logged in to do that'
      redirect_to root_path
    end
  end

  def account_owner_access_only
    if current_user != @user
      flash[:error] = 'The page you were trying to access is unavailable. Only the owner of the account can access that page.'
      redirect_to root_path
    end
  end

end
