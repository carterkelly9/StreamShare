class AdminController < ApplicationController
  before_action :get_session_user

  def index
    @users = User.all
    if !(current_user.is_admin)
    	redirect_to '/'
    end
  end

  private

    #TODO get user from session, redirect if not admin
    def get_session_user
      @admin =  Admin.first
    end
end
