class ContactMessage < ActiveRecord::Base
  belongs_to :user
  
  after_create do
    send_contact_message
    track_analytics
  end
  
  def name
    if user != nil
      name = self.user.first_name.to_s + ' ' + self.user.last_name.to_s
    else
      name = self.email
    end
    return name
  end
  
  def send_contact_message
    Resque.enqueue(SendContactMessage, self.id)
  end
  
  def track_analytics
    # Mixpanel Tracking Analytics
    @analytics = Analytics.new(self.user != nil ? self.user.full_name : ('Guest_'+ Time.now.to_i.to_s))
    @analytics.track('Contact message sent')
  end
  
end
