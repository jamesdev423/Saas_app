class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do
  	flash[:warning] = 'Resource not found.'
  	redirect_back_or root_path
  end

  def redirect_back_or(path)
  	redirect_to request.referer || path
  end
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :name, :stripe_card_token, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :name,:email, :password, :password_confirmation) }
    end
end
