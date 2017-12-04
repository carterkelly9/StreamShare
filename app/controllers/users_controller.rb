class UsersController < ApplicationController
  add_flash_types :user_operation_notice

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

   notice = ""
   if @current_user.is_admin && @current_user != user
     user.destroy
     notice = "The user #{user.name} has been deleted."
   end

     redirect_to admin_path, user_operation_notice: notice
 end

 def profile
    if session[:user_id]
      @user = User.find_by_email(current_user.email)
    else
      redirect_to login_path
  end
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
