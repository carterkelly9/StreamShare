class WelcomeController < ApplicationController
  before_action :get_session_user

  # GET /welcome
  def index
    if @user.type == "Admin"
      @is_admin = true
      @admin = @user
      @users = User.all - [@user]
    end
    @uploads = @user.uploads
  end

  private

  def get_session_user
    require_user
    current_user
    @user = @current_user
  end

end
