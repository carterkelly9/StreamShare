class WelcomeController < ApplicationController
  before_action :get_session_user

  # GET /welcome
  def index
    if @user.type == "Admin"
      @is_admin = true
      @admin = @user
      @users = User.all
    end
    @uploads = Upload.where(user_id: current_user.id)
  end

  private

  def get_session_user
    require_user
    current_user
    @user = @current_user
  end

end
