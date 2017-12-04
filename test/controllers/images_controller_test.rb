require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  def setup
    @currUser = users(:sUser)
    session[:user_id] = @currUser.id
    @title = "test image"
     @attachment_file = fixture_file_upload('lang-logo.png', 'image/png', :binary)
    @upload_file = Image.create(title: @title, filename: @attachment_file)
    @currUser.media << @upload_file
  end
  test "viewing image index" do
    get :index
    assert_select "h1", "#{@currUser.name}\'s Image Library"
  end

  test "uploading new image" do
    get :new
    assert_select "h1", "Upload Image"
  end
# #?????
#   test "uploading image successfully" do
#     get :create, {:image => {title: @title, filename: @attachment_file}}
#     assert_redirected_to root_path
#   end
#?????
#   test "uploading image failed" do
#     get :create, {image: {title: @title}}
#     assert_select "h1", "Upload Image"
#   end
# #?????
#   test "deleting image successfully" do
#       delete :destroy, id: @upload_file
#       assert_redirected_to root_path
#   end
end
