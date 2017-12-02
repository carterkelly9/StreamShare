class Invite < ActiveRecord::Base
  before_create :generate_key

  validates :owner_id, presence: true
  validates :medium_id, presence: true
  # validates :key, presence: true

  def generate_key
    length = 5
    begin
      self.key = SecureRandom.urlsafe_base64 length
    end while Invite.exists?(key: self.key)
  end

  def medium
    return Medium.find(self.medium_id)
  end

end
