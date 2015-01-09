class SendSignupMessage
  @queue = :send_signup_message_queue 
  
  def self.perform(user_id) 
    
    # Get User
    user = User.find_by_id(user_id)
    
    # Send Signup Email
    UserMailer.signup_message(user.email).deliver
    
  end 
  
end