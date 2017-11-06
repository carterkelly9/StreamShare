require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Medium belongs to User" do
    m = media(:one)
    u = users(:user)
    u.media << m

    assert u.media.first.id == m.id
  end
end
