class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  

  def contact_message(contact_message)
    @config = Info.first
    @msg = contact_message
    mail :subject => @msg.title,
         :to      => @config.contact_email,
         :from    => @msg.email,
         :from_name => @msg.name
  end
  
end