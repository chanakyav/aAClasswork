class SessionsController < ApplicationController

  before_action :signin_callback, except: [:destroy]

  def new
    render
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if user.nil?
      render json: "Credentials were wrong"
    else
      login_user!
      redirect_to cats_url
    end
  
  end

  def destroy
    user = current_user
    user.reset_session_token! if user
    session[:session_token] = ""
    redirect_to cats_url
  end

end
