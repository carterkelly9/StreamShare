class User < ActiveRecord::Base
	has_many :media
	validates :name, numericality: false, length: {minimum:1, maximum: 50}, presence: true
	validates :email, uniqueness: true, presence: true, case_sensitive: false
	validates :password, confirmation: { case_sensitive: true }, length: {minimum:6, maximum: 30}, presence: true
end

