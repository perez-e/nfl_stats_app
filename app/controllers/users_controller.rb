class UsersController < ApplicationController
	def create
		user = params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation)
		User.create(user)

		redirect_to "/"
	end
end
