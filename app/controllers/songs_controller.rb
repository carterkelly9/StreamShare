class SongsController < ApplicationController
  before_action :get_session_user

  def index
    @songs = Song.where(user_id: current_user.id)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id

    if @song.save
      redirect_to root_path, notice: "The song #{@song.title} has been uploaded."
    else
      render "new"
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to root_path, notice: "The song #{@song.title} has been deleted."
  end

private

  def get_session_user
    require_user
    current_user
    @user = @current_user
  end

  def song_params
    params.require(:song).permit(:title, :filename)
  end
end
