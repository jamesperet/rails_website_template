class AdminPanelController < ApplicationController
  
  def index
    redirect_to admin_dashboard_path
  end
  
  def dashboard
    @users = User.all
    @posts = BlogPost.all
  end

  def posts
     @posts = BlogPost.all
  end

  def users
    @users = User.all
  end
end
