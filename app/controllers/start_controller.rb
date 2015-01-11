class StartController < ApplicationController
  
  def index
    @blog_posts = BlogPost.order('created_at DESC').take(4)
    @subscription = Subscription.new
    @analytics.track('Home page view')
  end

end
