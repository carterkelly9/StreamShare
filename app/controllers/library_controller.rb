class LibraryController < ApplicationController

  #helper methods:

  #TODO get user from session
  def get_session_user
    return User.first
  end

  #Controller actions:

  def index
    @user = get_session_user
  end

  def delete
    medium_id = params[:medium_id];
    if Medium.exists?(medium_id)
      m = Medium.find(medium_id)
      m.destroy
    end

    redirect_to :action => 'index'
  end
end
