class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to subs_url
    else
      render :new
    end
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      login(user)
      redirect_to subs_url
    else
      flash.now[:errors] = "no bueno on username password"
      render :new
    end
  end

  def destroy
    logout
  end

end
