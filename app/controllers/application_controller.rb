class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied! Please sign up!'
    redirect_to root_url
  end
end
