require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @username = 'test_user'
    @password = 'testpassword'
    @email = 'testemail@test.com'
  end

  def teardown

  end

  test "sign up" do
    get	:new
    assert_response :success

    get :create, {user:{name:@username, email: @email, password: @password, password_confirmation: @password}}
    user = User.find_by_email(@email)
    assert user && user.authenticate(@password)
    assert_redirected_to root_path
  end

  test "sign up bad password confirmation" do
    get	:new
    assert_response :success

    get :create, {user:{name:@username, email: @email, password: @password, password_confirmation: @password+"oops"}}
    user = User.find_by_email(@email)
    assert_not user && user.authenticate(@password)
    assert_select 'div#error_explanation'
  end

  test "sign up with existing email" do
    get	:new
    assert_response :success

    get :create, {user:{name:@username, email: users(:user).email, password: @password, password_confirmation: @password}}
    user = User.find_by_email(@email)
    assert_not user && user.authenticate(@password)
    assert_select 'div#error_explanation'
  end

end
