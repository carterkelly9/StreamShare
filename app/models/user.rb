class User < ActiveRecord::Base
	has_secure_password
	has_many :media
	validates :name, numericality: false, length: {minimum:1, maximum: 50}
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true, case_sensitive: false
	validates :password, length: {minimum:6}
end
