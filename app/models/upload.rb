class Upload < ActiveRecord::Base
  belongs_to :user
  mount_uploader :attachment, AttachmentUploader
  validates :title, :attachment, presence: true
end
