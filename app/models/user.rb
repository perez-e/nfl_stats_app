# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
	has_secure_password
	has_many :user_players
	has_many :players, through: :user_players
	before_save :create_remember_token

	before_save do |user| 
		user.email = email.downcase
		user.first_name = first_name.capitalize
		user.last_name = last_name.capitalize
	end 

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true,
	                format:     { with: VALID_EMAIL_REGEX },
	                uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }, on: :create
	validates :password_confirmation, presence: true, on: :create

    private

    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end
end
