class WelcomeController < ApplicationController

    def new
    end

  	def create
      current_user
      authorize
  	end

    def index
    end

end
