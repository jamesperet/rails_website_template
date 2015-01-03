module NavigationHelpers

  def path_to(page_name) 
  
    case page_name 
  
    when/the homepage/ 
      root_path 
      
    when/the admin dashboard/ 
      visit admin_dashboard_path

    when/the configurations page/ 
      visit admin_config_path
  
    when/the blog page/ 
      visit blog_path 
      
    when/the contact page/ 
      visit contact_messages_path 
      
    when/the admin blog posts page/
      visit admin_posts_path
      
    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
    
  end
end

World(NavigationHelpers)