class SendNewsletterSubscription
  @queue = :send_newsletter_subscription_queue 
  
  def self.perform(id) 
    
    # Get subscription
    subscription = Subscription.find_by_id(id)
    # Send newsletter subscription email
    UserMailer.newsletter_subscription(subscription).deliver 
    
  end 
  
end