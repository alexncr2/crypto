class UsersController < ApplicationController

	skip_before_action :authorize, only: [:new, :create]

	def new
		@user = User.new
		if logged_in?
			redirect_to '/', alert: 'Already registered'
		end
	end


	def create
		user = User.new user_params
		if user.save
			session[:user_id] = user.id
			redirect_to '/welcome'
		else
			redirect_to '/signup', alert: 'Invalid name or password'
		end
	end


	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end


end
