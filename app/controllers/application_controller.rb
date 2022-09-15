class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_path, :alert => exception.message
	end

	protect_from_forgery with: :exception
	
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [ :firstname, :lastname, :email, :password, :password_confirmation, :pt, :avatar, :avatar_url, :gender, :certificate, :description])
			devise_parameter_sanitizer.permit(:account_update, keys: [ :firstname, :lastname, :email, :password, :password_confirmation, :pt, :avatar, :gender, :certificate, :description])
		end     
end
