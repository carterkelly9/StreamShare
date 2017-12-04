require 'test_helper'

class LibraryControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  def setup
  	@currUser = users(:sUser)
  	session[:user_id] = @currUser.id
  	@file = media(:mOne)
  	@currUser.media << @file
  end

  # test "go to user library page" do
  # 	get :index
  # 	assert_select "h1", "#{@currUser.name}\'s Image Library"
  # end
  
  # test "search returns no match" do
  # end

  # test "search returns match" do
  # end

  test "delete media file" do
  	delete :delete, id: @file
  	assert_redirected_to root_path
  end
end
