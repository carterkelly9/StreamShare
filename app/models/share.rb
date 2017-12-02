class Share < ActiveRecord::Base

  validates :owner_id, presence: true
  validates :medium_id, presence: true
    # validates :guest_id, presence: true
    # validates :key, presence: true

def medium
  return Medium.find(medium_id);
end

end
