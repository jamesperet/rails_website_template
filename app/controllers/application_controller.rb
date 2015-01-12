class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  
  before_filter :config_site
  
  before_filter :check_admin_mode
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  before_filter :analytics
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :current_password, :avatar, :password, :password_confirmation, :avatar_tmp, :avatar_processing) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
  end
    
  def config_site  
    @config = Info.first
    #I18n.config.enforce_available_locales = false
    I18n.default_locale = @config.default_language
  end
  
  def analytics
    if current_user != nil
      @id_analytics = current_user.full_name
    else
      @id_analytics = 'Guest_'+ Time.now.to_i.to_s
    end
    @analytics ||= Analytics.new(@id_analytics)
  end
  
  def after_sign_in_path_for(resource_or_scope)
      @analytics.track_user_sign_in(current_user)
      stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end
  
  protected

    def check_admin_mode
      if @config.maintenance_mode && controller_name != 'sessions' && !user_signed_in? && action_name != 'maintenance_mode'
        render 'admin_panel/maintenance_mode'
      elsif !@config.maintenance_mode && !user_signed_in? && action_name == 'maintenance_mode'
        redirect_to root_path
      end
    end
  
end
