class Medium < ActiveRecord::Base
  belongs_to :user

  mount_uploader :media, MediaUploader
  validates :title, presence: true
end
