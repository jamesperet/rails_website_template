class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  
  before_filter :config_site
  
  before_filter :check_admin_mode
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :current_password, :avatar) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
  end
    
  def config_site  
    @config = Info.first
    #I18n.config.enforce_available_locales = false
    I18n.default_locale = @config.default_language
  end
  
  protected

    def check_admin_mode
      if @config.maintenance_mode && controller_name != 'sessions' && !user_signed_in? && action_name != 'maintenance_mode'
        redirect_to maintenance_mode_path
      elsif !@config.maintenance_mode && !user_signed_in? && action_name == 'maintenance_mode'
        redirect_to root_path
      end
    end
  
end
