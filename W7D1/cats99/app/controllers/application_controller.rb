class ApplicationController < ActionController::Base

  helper_method :current_user

  def login!(user)
    @current_user = user
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login_user!
    login!(self)
  end

  def log_in?
    !!current_user
  end

  def signin_callback
    if log_in?
      redirect_to cats_url
    end
  end
end
