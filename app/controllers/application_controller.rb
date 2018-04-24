class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find session[:user_id] if session[:user_id]
  		#runs only if current_user isn't already set
	end

	helper_method :current_user


    before_action :authorize
    

    private
    def authorize
        unless logged_in?
    		redirect_to '/login', alert: 'you have to log in to access this page'
        end
    end

    def logged_in?
        !current_user.nil?
    end



end
