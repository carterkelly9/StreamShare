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
    # @videos = @user.videos
    # @images = @user.images
    # @songs = @user.songs

  end

  def uploader
    @video = Video.new
    @song = Song.new
    @image = Image.new
  end


  private

  def get_session_user
    require_user
    current_user
    @user = @current_user
  end

end
