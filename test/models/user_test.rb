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

  test 'valid user' do
  	user = User.new(name: 'test', email: 'test@test.com', password: BCrypt::Password.create('testtest', cost: 5))
  	assert user.valid?
  end

  test 'invalid without name' do
  end

  test 'invalid without email' do
  end

  test 'invalid without password' do
  end

  test 'email is unique' do
   	user = User.new(name: 'test', email: 'test@test.com', password: BCrypt::Password.create('testtest', cost: 5))
   	user.save
   	user2 = User.new(name: 'test', email: 'test@test.com', password: BCrypt::Password.create('testtest', cost: 5))
   	assert_not user2.valid?
  end

  test 'password is invalid' do 
  end

  test 'name is invalid' do
  end

  
end
