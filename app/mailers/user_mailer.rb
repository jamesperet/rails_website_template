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
  
end