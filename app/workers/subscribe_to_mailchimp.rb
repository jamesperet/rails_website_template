class SubscribeToMailchimp
  @queue = :subscribe_to_mailchimp_queue 
  
  def self.perform(id) 
    
    # Get User
    subscription = Subscription.find_by_id(id)

    return true if (Rails.env.test? && !testing)
    list_id = ENV['MAILCHIMP_LIST_ID']
    response = Rails.configuration.mailchimp.lists.subscribe({
      id: list_id,
      email: {email: subscription.email},
      double_optin: false
    })

    
  end 
  
end