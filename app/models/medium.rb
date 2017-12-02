class Medium < ActiveRecord::Base
  belongs_to :user
  has_one :upload

  #users this medium is shared with
  def shared_users
    shares = Share.where(owner_id: self.user_id, medium_id: self.id)
    return User.find(shares.map(&:guest_id))
  end
end
