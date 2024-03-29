class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :address1
      devise_parameter_sanitizer.for(:sign_up) << :address2
      devise_parameter_sanitizer.for(:sign_up) << :postcode

      devise_parameter_sanitizer.for(:account_update) << :name
      devise_parameter_sanitizer.for(:account_update) << :address1
      devise_parameter_sanitizer.for(:account_update) << :address2
      devise_parameter_sanitizer.for(:account_update) << :postcode

    end  
end
