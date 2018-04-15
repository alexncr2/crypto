class WelcomeController < ApplicationController
	skip_before_action :authorize, only: [:index]

    def new
    end

  	def create
  	end

    def index
    end

end
