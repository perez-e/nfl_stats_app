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
#

class User < ActiveRecord::Base
	has_secure_password

	before_save :create_remember_token

    private

    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end
end