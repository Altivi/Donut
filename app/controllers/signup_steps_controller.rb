class SignupStepsController < ApplicationController
	include Wicked::Wizard
	steps :identifying, :personal

	def show
		@user = current_user
		render_wizard
	end

	def update
		@user = current_user
		@user.update_attributes(user_params)
		render_wizard @user
	end

	private 

	def user_params
		params.require(:user).permit(:first_name, :last_name, :avatar)
	end
end
