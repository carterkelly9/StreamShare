require 'test_helper'

class ShareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'valid share' do
  	share = Share.new(owner_id: '1', medium_id: '1')
  	assert share.valid?
  end

  test 'invalid without owner_id' do
  	share = Share.new(owner_id: '1')
  	assert_not share.valid?
  end

  test 'invalid without medium_id' do
  	share = Share.new(medium_id: '1')
  	assert_not share.valid?
  end
end
