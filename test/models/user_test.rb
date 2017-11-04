require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Admin is a User" do
      assert User.exists?(users(:admin))
  end

  test "User is not an Admin" do
      assert_not Admin.exists?(users(:user))
  end

end
