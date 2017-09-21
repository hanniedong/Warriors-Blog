module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    session[:user_id] == 1
  end 

  def logged_in?
    !!current_user
  end

  def login
    session[:user_id] = @user.id
  end

  def logout
    session[:user_id] = nil
  end
end