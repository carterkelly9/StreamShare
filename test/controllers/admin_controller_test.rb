require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  test "regular user cannot access to admin page" do
  	regUser = users(:sUser)
  	session[:user_id] = regUser.id
  	get :index
  	assert_redirected_to root_path
  end


end
