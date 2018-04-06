class SessionsController < ApplicationController

	skip_before_action :require_login, only: [:new, :create]

	def new
	end

	def create
		user = User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/welcome'
		else
			redirect_to '/login', alert: 'Invalid user'
		end
	end

	def destroy
		if current_user
			session[:user_id] = nil
			redirect_to '/login'
		else
			redirect_to '/welcome'
		end
	end


end
