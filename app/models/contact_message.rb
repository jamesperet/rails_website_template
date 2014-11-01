class ContactMessage < ActiveRecord::Base
  belongs_to :user
  
  def name
    if user != nil
      name = self.user.first_name.to_s + ' ' + self.user.last_name.to_s
    else
      name = self.email
    end
    return name
  end
  
end
