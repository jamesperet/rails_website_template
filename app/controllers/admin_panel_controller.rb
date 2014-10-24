class AdminPanelController < ApplicationController
  
  layout 'admin'
  
  def index
    redirect_to admin_dashboard_path
  end
  
  def dashboard
    @users = User.all
    @posts = BlogPost.all
    @files = Upload.all
  end

  def posts
     @posts = BlogPost.all
  end

  def contact_messages
    @contact_messages = ContactMessage.order('created_at DESC').all
  end

  def users
    @users = User.all
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
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_params
      params.require(:info).permit(:website_name, :tagline, :contact_email, :default_language)
    end
  
end
