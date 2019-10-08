class UsersController < ApplicationController

  def new
    @user = User.new
    if logged_in?
      redirect_to subs_url
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to subs_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
