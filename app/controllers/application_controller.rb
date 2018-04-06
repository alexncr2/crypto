class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find session[:user_id] if session[:user_id]
  		#runs only if current_user isn't already set
	end

	helper_method :current_user

	#homework: use this method in a new controller
	#if user isn't logged in it isn't authorized
	def authorize
		redirect_to '/login' unless current_user
    redirect_to '/welcome' if current_user
	end



  before_action :require_login

  private

  def require_login
    unless logged_in?
  		redirect_to '/', alert: 'Please log in'
    end
  end

  def logged_in?
    !current_user.nil?
  end


end
