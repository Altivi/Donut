class StaticPagesController < ApplicationController

	def home
		@user = current_user
	end

	def contacts
	end
	
end
