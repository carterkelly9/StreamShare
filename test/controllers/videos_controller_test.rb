require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  def setup
    @currUser = users(:sUser)
    session[:user_id] = @currUser.id
    @title = "test video"
     @attachment_file = fixture_file_upload('ROR-MVC.mp4', 'video/mp4', :binary)
    @upload_file = Video.create(title: @title, filename: @attachment_file)
    @currUser.media << @upload_file
  end
  test "viewing video index" do
    get :index
    assert_select "h1", "#{@currUser.name}\'s Video Library"
  end

  test "uploading new video" do
    get :new
    assert_select "h1", "Upload Video"
  end

  test "uploading video successfully" do
    get :create, {:video => {title: @title, filename: @attachment_file}}
    assert_redirected_to root_path
  end
# #?????
#   test "uploading video failed" do
#     get :create, {video: {title: @title, filename: "" }}
#     assert_routing '/videos', controller: 'videos'
#     assert_select "h1", "Upload Video"
#   end
# #?????
  test "deleting video successfully" do
      delete :destroy, id: @upload_file
      assert_redirected_to root_path
  end
end
