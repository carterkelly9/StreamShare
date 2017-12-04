class Medium < ActiveRecord::Base
  before_destroy :delete_shares_and_invites

  belongs_to :user
  has_one :upload

  #users this medium is shared with
  def shared_users
    shares = Share.where(owner_id: self.user_id, medium_id: self.id)
    return User.find(shares.map(&:guest_id))
  end

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end

  private
  def delete_shares_and_invites
    Share.where(medium_id: id).destroy_all
    Invite.where(medium_id: id).destroy_all
  end
end
