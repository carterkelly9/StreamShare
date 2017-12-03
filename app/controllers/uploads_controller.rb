class UploadsController < ApplicationController
  before_action :get_session_user

  def index
    @uploads = @user.uploads
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @user.uploads << @upload

    if @upload.save
      redirect_to root_path, notice: "The file #{@upload.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to root_path, notice: "The file #{@upload.title} has been deleted."
  end

private

  def get_session_user
    require_user
    current_user
    @user = @current_user
  end

  def upload_params
    params.require(:upload).permit(:title, :attachment)
  end

end
