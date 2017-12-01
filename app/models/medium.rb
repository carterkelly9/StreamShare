class Medium < ActiveRecord::Base
  belongs_to :user
  has_one :upload
end
