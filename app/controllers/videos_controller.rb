class VideosController < ApplicationController
  before_action :get_session_user

  def index
    @videos = Video.where(user_id: current_user.id)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id

    if @video.save
      redirect_to root_path, notice: "The video #{@video.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to root_path, notice: "The video #{@video.title} has been deleted."
  end

private

  def get_session_user
    require_user
    current_user
    @user = @current_user
  end

  def video_params
    params.require(:video).permit(:title, :filename)
  end

end
