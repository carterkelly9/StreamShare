require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  
  def setup
    @user = User.create(name: 'test', email: 'test@test.com', password: BCrypt::Password.create('testtest', cost: 5))
    session[:user_id] = @user.id
    @attachment_file = fixture_file_upload('lang-logo.png', 'image/png', :binary)
    @title = 'test'
    @upload_test = Upload.create(title: @test, attachment: @attachment_file)
    @user.uploads << @upload_test
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create, {upload:{title: @upload_test.title, attachment: @attachment_file}}
    assert_response :success
  end
end
