class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :authenticate_user! , :logged_in?, :authenticate_user, :sign_in, :sign_out, :redirect_if_logged_in


  def authenticate_user!
    redirect_to new_session_path unless logged_in?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.clear
  end

  def authenticate_user(auth_params)
    if user = User.find_by(:username => auth_params[:username])
      return user if user.authenticate(auth_params[:password])
    else
      return false
    end
  end

  def current_user
    return User.find_by(:id => session[:user_id])
  end

  def logged_in?
    return !!session[:user_id]
  end

  def redirect_if_logged_in
    redirect_to  root_path if logged_in?
  end

end
