class UserMailer < ActionMailer::Base
  default from: "contact@website.com"
  

  def contact_message(contact_message, to_address)
    @msg = contact_message
    mail :to        => to_address,
         :subject   => @msg.title,
         :from      => @msg.user == nil ? @msg.email : @msg.user.email,
         :from_name => @msg.user != nil ? @msg.user.full_name : @msg.email,
         :body      => @msg.content
  end
  
  def newsletter_subscription(subscription)
    config = Info.first
    mail :to        => subscription.email,
         :subject   => (t 'newsletter_subscription.subject'),
         :from      => config.contact_email,
         :from_name => config.website_name,
         :body      => (t 'newsletter_subscription.message')
  end
  
end