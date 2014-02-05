class SessionsController < ApplicationController
    def create
		user=User.find_by_email(params[:user][:email].downcase)
		if user && user.authenticate(params[:user][:password])
			# Sign the user in and redirect to the user's show page.
			sign_in user
			redirect_to "/"
		else
			# Create an error message and re-render the signin form.
			flash.now[:error]='Invalid email/password combination'
			redirect_to "/"
		end
    end

    def destroy
        sign_out
        redirect_to root_url
    end
end
