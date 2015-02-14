module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  # Before filters
  
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by_username(params[:username])
    unless current_user? @user
      flash[:danger] = "Unauthorized access."
      redirect_to root_url
    end
  end

end
