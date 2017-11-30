class Medium < ActiveRecord::Base
  belongs_to :user
  has_one :upload
  mount_uploader :media, MediaUploader
  validates :title, presence: true
end
