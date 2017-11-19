class SessionsController < ApplicationController
  def new
    @failed_login = params[:failed_login]
  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]

    if verify_user(email, password)
      session[:user_id] = @user.id
      render "welcome/index"
    else
      redirect_to login_path(failed_login: true)
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def verify_user(email, password)
    @user = User.find_by_email(email)
    return @user && @user.authenticate(password)
  end
end
