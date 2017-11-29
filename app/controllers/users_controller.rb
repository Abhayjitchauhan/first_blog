class UsersController < ApplicationController
	def articles 
		@articles=current_user.articles
	end


	def profile
		@user=current_user
	end
end
