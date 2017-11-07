class WelcomeController < ApplicationController
  before_action :get_session_user

  # GET /welcome
  def index
    if @user.type == "Admin"
      @is_admin = true
      @admin = @user
      @users = User.all
    end
  end

  private

  #TODO get user from session
  def get_session_user
    @user = Admin.first
  end

end
