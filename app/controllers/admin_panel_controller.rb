class AdminPanelController < ApplicationController
  
  layout 'admin'
  
  before_filter :authenticate_user
  
  def maintenance_mode
  end
  
  def index
    redirect_to admin_dashboard_path
  end
  
  def dashboard
    @users = User.all
    @posts = BlogPost.all
    @files = Upload.all
    @contact_messages = ContactMessage.all
    @new_messages = @contact_messages.where(:unread => true)
  end

  def posts
     @posts = BlogPost.all
  end

  def contact_messages
    @contact_messages = ContactMessage.order('created_at DESC').all
  end
  
  def show_contact_message
    @msg = ContactMessage.find(params[:id])
  end

  def users
    @users = User.order('created_at DESC').all
  end
  
  def files
    @uploads = Upload.all
  end
  
  def site_config
    @config = Info.first
  end
  
  def site_config_update
    @config = Info.first
    respond_to do |format|
      if @config.update(info_params)
        format.html { redirect_to admin_config_path, notice: (t 'admin_panel.config_update_success') }
        format.json { head :no_content }
      else
        format.html { render action: 'site_config' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def make_admin
    @user = User.find(params[:id])
    if @user.admin == true
      @user.admin = false
      status = "admin_panel.unmake_admin_success"
    else
      @user.admin = true
      status = "admin_panel.make_admin_success"
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: (t status) }
        format.json { head :no_content }
      else
        format.html { redirect_to admin_users_path, alert: (t 'admin_panel.make_admin_error') }
        format.json { head :no_content }
      end
    end
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_params
      params.require(:info).permit(:website_name, :website_link, :tagline, :contact_email, :server_email, :default_language, :maintenance_mode, :maintenance_title, :maintenance_message)
    end
  
    def authenticate_user 
      redirect_to root_path, alert: (t 'admin_panel.permission_denied') unless current_user && current_user.admin?
    end
  
end
