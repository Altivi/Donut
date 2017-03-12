class StaticPagesController < ApplicationController

	def home
		@user = current_user
    @posts = @user.try(:posts).try(:order, 'created_at DESC')
	end

	def contacts
	end
	
end
