require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'valid invite' do
  	invite = Invite.new(owner_id: '1', medium_id: '1')
  	assert invite.valid?
  end

  test 'invalid without owner_id' do
  	invite = Invite.new(owner_id: '1')
  	assert_not invite.valid?
  end

  test 'invalid without medium_id' do
    invite = Invite.new(medium_id: '1')
    assert_not invite.valid?
  end
end
