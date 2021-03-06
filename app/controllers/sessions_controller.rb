class SessionsController < ApplicationController
  protect_from_forgery prepend: true, with: :exception

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to tests_path
      redirect_to cookies[:path]
    else
      render :new
    end
  end

  def delete
    session.delete(:user_id)
    redirect_to root_path
  end
end
