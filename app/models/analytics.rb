class Analytics 

  require 'mixpanel-ruby'
  
  
  def initialize(id)
    @tracker = Mixpanel::Tracker.new(ENV["MIXPANEL_PROJECT_TOKEN"])
    @id = id
  end 
  
  def track(page)
    @tracker.track(@id, page)
  end
  
  def track_user_registration(user)
    identify(user)
    @tracker.track(user.full_name, 'User registration')
  end 
  
  def track_user_sign_in(user)
    identify(user)
    @tracker.track(user.full_name, 'User sign in')
    @tracker.people.plus_one(user.full_name, "logins")
  end 
  
  private 
  
  def identify(user)
    @tracker.people.set(user.full_name, {
        '$first_name' => user.first_name,
        '$last_name' => user.last_name,
        '$email' => user.email,
        'admin' => user.admin.to_s
    })
   
  end 
  
end
