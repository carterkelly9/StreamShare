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
  	user = User.new(email: 'test@test.com', password: BCrypt::Password.create('testtest', cost: 5))
 	assert_not user.valid?
  end

  test 'invalid without email' do
  	user = User.new(name: 'test', password: BCrypt::Password.create('testtest', cost: 5))
  	assert_not user.valid?
  end

  test 'invalid without password' do
  	user = User.new(name: 'test', email: 'test@test.com')
  	assert_not user.valid?
  end

  test 'email is unique' do
   	user = User.new(name: 'test', email: 'test@test.com', password: BCrypt::Password.create('testtest', cost: 5))
   	user.save
   	user2 = User.new(name: 'test2', email: 'test@test.com', password: BCrypt::Password.create('testtest', cost: 5))
   	assert_not user2.valid?
  end

  test 'password is too short' do 
  	user = User.new(name: 'test', email: 'test@test.com', password: 'test')
  	assert_not user.valid?
  end

  test 'invalid email format' do
  	user = User.new(name: 'test', email: 'test', password: BCrypt::Password.create('testtest', cost: 5))
  	assert_not user.valid?
  end

  test 'email is case insensitive' do
  	user = User.new(name: 'test', email: 'TEST@test.COM', password: BCrypt::Password.create('testtest', cost: 5))
  	assert user.valid?
  end

   test "user has media" do
   	user = User.new(name: 'test', email: 'test@test.com', password: BCrypt::Password.create('testtest', cost: 5))
   	test1 = Medium.new(title: 'Test1')
   	test2 = Medium.new(title: 'Test2')
   	user.media << test1
   	user.media << test2
	assert user.media.first.id == test1.id && user.media.second.id == test2.id
  end
end
