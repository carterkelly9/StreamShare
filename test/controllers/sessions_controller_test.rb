require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @password = 'testpassword'
    @user = User.create(name: 'testuser', email: 'testemail@test.com', password: @password)
  end

  def teardown
    @user.destroy
  end

  test "log in" do
    get	:new
    assert_response :success

    get :create, {session:{email: @user.email, password: @password}}
    assert_redirected_to root_path

  end
end
