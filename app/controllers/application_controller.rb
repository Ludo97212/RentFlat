class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show, :homepage]

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :avatar)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username, :email, :password, :current_password, :avatar)}
  end
end
