class SendContactMessage
  @queue = :send_contact_message_queue 
  
  def self.perform(id) 
    
    # Get contact message
    msg = ContactMessage.find_by_id(id)
    # Get webmaster email addresss
    to_address = Info.first.contact_email
    # Send Contact Message Email
    UserMailer.contact_message(msg, to_address).deliver 
    
  end 
  
end