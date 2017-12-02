class User < ActiveRecord::Base
	has_secure_password
	has_many :media
	has_many :uploads
	validates :name, length: {minimum:1, maximum: 50}
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true, case_sensitive: false, presence: true
	validates :password, length: {minimum:6}

	def is_admin
		return self.type == "Admin"
	end

 #get list of media shared with user
	def shared_media
		return Medium.find(Share.where(guest_id: id).map(&:medium_id));
	end

	#get list of media shared by user with others
	def media_shared_by
		return Medium.find(Share.where(owner_id: id).map(&:medium_id));
	end
end
