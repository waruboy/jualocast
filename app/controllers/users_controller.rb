class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by_username(params[:username])
    @feeds = Feed.where(user: @user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to JualoCast!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
end
