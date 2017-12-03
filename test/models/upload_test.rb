require 'test_helper'
include ActionDispatch::TestProcess
class UploadTest < ActiveSupport::TestCase 
  # test "the truth" do
  #   assert true
  # end

def setup
    @attachment_file = fixture_file_upload('/lang-logo.png', 'image/png', :binary)
  end

  test "Upload belongs to User" do
  	file = uploads(:uOne)
  	user = users(:sUser)
  	user.uploads << file

  	assert user.uploads.first.id == file.id
  end

  test 'invalid without title' do
  	file = Upload.new(attachment: @attachment_file)
  	assert_not file.valid?
  end

  test 'invalid without attachment' do
  	file = Upload.new(title: "test")
  	assert_not file.valid? 
  end

   test 'valid upload' do
  	file = Upload.create(title: "test", :attachment => @attachment_file)
  	assert(File.exists?(file.reload.attachment.file.path))
  end
end
