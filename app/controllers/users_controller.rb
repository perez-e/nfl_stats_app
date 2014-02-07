class UsersController < ApplicationController
	def create
		user = params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation)
		u = User.new(user)

		if u.save
			# Sign the user in and redirect to the user's show page.
			sign_in u
			flash[:success] = 'Signed In Successfully!'
			redirect_to "/users/#{u.id}"
		else
			# Create an error message and re-render the signin form.
			flash[:error]='Invalid User Credentials'
			redirect_to "/"
		end

	end

	def show 
		@user = User.find(params[:id])
	end

	def destroy 
		user = User.find(params[:id])
		sign_out
		user.destroy

		redirect_to "/"
	end

	def favorite
		@players = current_user.players
	end
end
