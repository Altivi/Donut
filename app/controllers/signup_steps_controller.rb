class SignupStepsController < ApplicationController

	before_action :authenticate_user!
	include Wicked::Wizard

	steps :identifying, :personal

	def show
		@user = current_user
		render_wizard
	end

	def update
		@user = current_user
		@user.signup_status = step.to_s
		@user.signup_status = 'active' if step == steps.last
		@user.update_attributes(personal_params)
		render_wizard @user
	end

	# def update
	# 	@user = current_user
	# 	puts step
	# 	case step.to_s
	# 	when 'identifying'
	# 		if @user.update_attributes(identifying_params)
	# 			@user.update_attribute(:signup_status, step.to_s)
	# 			puts "!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!_!"
	# 		end
	# 	when 'personal'
	# 		if params[:user].nil?

	# 		if @user.update_attributes(personal_params)
	# 			@user.update_attribute(:signup_status, step.to_s)
	# 			puts "1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1"
	# 		end
	# 	end
	# 	render_wizard @user
	# end


	private 

	def finish_wizard_path
		root_path
	end

	def identifying_params
		params.require(:user).permit(:first_name, :last_name, :birth_date)
	end
	def personal_params
		#params[:user].present? ? params.require(:user).permit(:first_name, :last_name, :birth_date, :avatar, :about_me) : {}
		params.require(:user).permit(:first_name, :last_name, :birth_date, :avatar, :about_me)
	end
end
