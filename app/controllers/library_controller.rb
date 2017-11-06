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
end
