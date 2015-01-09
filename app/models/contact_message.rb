class ContactMessage < ActiveRecord::Base
  belongs_to :user
  
  after_create do
    send_contact_message
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
  
end
