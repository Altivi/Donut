class Users::RegistrationsController < Devise::RegistrationsController
 # before_action :configure_sign_up_params, only: [:create]
 before_action :configure_account_update_params, only: [:update, :profile_update]
  respond_to :json
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # def create
  #   build_resource(sign_up_params)

  #   resource.save
  #   yield resource if block_given?
  #   if resource.persisted?
  #     if resource.active_for_authentication?
  #       set_flash_message! :notice, :signed_up
  #       sign_up(resource_name, resource)
  #       respond_with resource, location: after_sign_up_path_for(resource)
  #     else
  #       set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
  #       expire_data_after_sign_in!
  #       respond_with resource, location: after_inactive_sign_up_path_for(resource)
  #     end
  #   else
  #     clean_up_passwords resource
  #     set_minimum_password_length
  #     case request.referrer
  #     when 'http://localhost:3000/'
  #       render 'static_pages/home'
  #     else
  #       respond_with resource
  #     end
  #   end
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  def profile
    @user = current_user
    render :edit_profile
  end

  def profile_update
    @user = current_user
    if @user.update(account_update_params)
      redirect_to auth_settings_profile_url
      flash[:notice] = "Profile Info was updated!"
    else
      render 'edit_profile'
    end
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :about_me, :birth_date, :last_name, :first_name])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
