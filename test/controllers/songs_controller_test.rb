require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  def setup
    @currUser = users(:sUser)
    session[:user_id] = @currUser.id
    @title = "test song"
     @attachment_file = fixture_file_upload('TK-Mr.mp3', 'song/mp3', :binary)
    @upload_file = Song.create(title: @title, filename: @attachment_file)
    @currUser.media << @upload_file
  end
  test "viewing song index" do
    get :index
    assert_select "h1", "#{@currUser.name}\'s Music Library"
  end

  test "uploading new song" do
    get :new
    assert_select "h1", "Upload Music"
  end
# #?????
#   test "uploading song successfully" do
#     post :create, {:song => {title: @title, filename: @attachment_file}}
#     assert_select "h1", "#{@currUser.name}\'s Library"
#   end
# #?????
#   test "uploading song failed" do
#     post :create, {song: {title: @title}}
#     assert_select "h1", "Upload Music"
#   end
# #?????
  test "deleting song successfully" do
      delete :destroy, id: @upload_file
      assert_redirected_to root_path
  end
end
