class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			login(@user)
			redirect_to users_path
		else
			redirect_to new_session_path
		end
	end

	def destroy
		session.clear
		flash[:notice] = "You have logged out"
		redirect_to new_session_path
	end
end