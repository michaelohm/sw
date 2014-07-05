class UsersController < ApplicationController
	def index
		if current_user
			@user = current_user
			@images = Image.all
			render 'index'
		else
			redirect_to new_session_path
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :username, :password)
	end

end