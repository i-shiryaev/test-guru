class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?,
                :logout

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'Are you a Guru? Verify your email and password please.'
      cookies[:path] = request.path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def cookie_path(path)
    cookies[:path] = path
  end
end
