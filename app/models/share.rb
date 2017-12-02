class Share < ActiveRecord::Base
validates :owner_id, presence: true
validates :guest_id, presence: true
validates :medium_id, presence: true
end
