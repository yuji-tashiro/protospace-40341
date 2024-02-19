class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_active_storage_url_options

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :profile, :occupation, :position])
  end

  def set_active_storage_url_options
    ActiveStorage::Current.url_options = {
      host: request.base_url,
      protocol: request.protocol
    }
  end
  
end
