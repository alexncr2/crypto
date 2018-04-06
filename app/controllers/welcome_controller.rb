class WelcomeController < ApplicationController
	skip_before_action :require_login, only: [:index]

    def new
    end

  	def create
  	end

    def index
    end

end
