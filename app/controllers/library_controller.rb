class LibraryController < ApplicationController
  before_action :get_session_user

  def index
    @medium = Medium.all
    if params[:search]
      @medium = Medium.search(params[:search]).where(user_id: current_user.id).order("created_at DESC")
    else
      @medium = Medium.all.order('created_at DESC')
    end
  end

  def new
      @medium = Medium.new
  end

  def create
    @medium = Medium.new(media_params)

    if @medium.save
      redirect_to library_path
    else
      render "new"
    end
  end

  def delete
    medium_id = params[:medium_id];
    if Medium.exists?(medium_id)
      m = Medium.find(medium_id)
      m.destroy
    end

    redirect_to root_path
  end

  private

  #TODO get user from session
  def get_session_user
    @user = User.first
  end

  def media_params
    params.require(:medium).permit(:title, :data)
  end

end
