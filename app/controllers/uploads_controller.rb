class UploadsController < ApplicationController
  before_action :get_session_user

  def index
    @uploads = Upload.where(user_id: current_user.id)
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.user_id = current_user.id

    if @upload.save
      redirect_to uploads_path, notice: "The file #{@upload.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to uploads_path, notice:  "The file #{@upload.title} has been deleted."
  end

private

  #TODO get user from session
  def get_session_user
    @user = User.first
  end

  def upload_params
    params.require(:upload).permit(:title, :attachment)
  end

end
