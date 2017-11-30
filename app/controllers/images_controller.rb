class ImagesController < ApplicationController
  before_action :get_session_user

  def index
      @images = Image.where(user_id: current_user.id)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id

    if @image.save
      redirect_to root_path, notice: "The image #{@image.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to root_path, notice: "The image #{@image.title} has been deleted."
  end

private

  def get_session_user
    require_user
    current_user
    @user = @current_user
  end

  def image_params
    params.require(:image).permit(:title, :filename)
  end

end
