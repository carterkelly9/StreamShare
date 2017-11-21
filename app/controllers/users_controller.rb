class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      session[:user_id] = @user.id
      redirect_to root_url

    else
     render :new
     failed_login = true
    end
 end

 def destroy
   get_session_user

   user = User.find(params[:id])

   if @current_user.is_admin && @current_user != user
     user.destroy
   end

     redirect_to root_path
 end

 private

 def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end

 def get_session_user
   require_user
   current_user
 end

end
