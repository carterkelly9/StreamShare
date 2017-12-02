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
end
