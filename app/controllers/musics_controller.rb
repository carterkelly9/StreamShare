class MusicsController < ApplicationController
  before_action :get_session_user

  def index
    @musics = Music.where(user_id: current_user.id)
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id

    if @music.save
      redirect_to root_path, notice: "The music #{@music.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @music = Music.find(param[:id])
    @music.destroy
    redirect_to root_path, notice: "The music #{@music.title} has been deleted."
  end

private

  def get_session_user
    require_user
    current_user
    @user = @current_user
  end

  def music_params
    params.require(:music).permit(:title, :filename)
  end

end
