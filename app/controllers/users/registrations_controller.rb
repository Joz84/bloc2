# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters

  def configure_permitted_parameters
    user_data = [
      :country,
      :first_name,
      :last_name,
      :birthday,
      :phone,
      :sex,
      :admin,
      :stripe_id
    ]

    devise_parameter_sanitizer.permit(:sign_up, keys: user_data)
    devise_parameter_sanitizer.permit(:account_update, keys: user_data)
  end

  def new
    redirect_to root_path and return if Date.today >= Date.new(2018, 8, 1)
    super
  end

  def create
    build_resource(sign_up_params)
    resource.create_charge(params[:stripeToken]) if resource.valid?
    if resource.save
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  rescue => e
    flash[:alert] = e.message
    render :new
  end

end
