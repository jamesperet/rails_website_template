json.array!(@contact_messages) do |contact_message|
  json.extract! contact_message, :id, :title, :email, :content, :unread, :user_id
  json.url contact_message_url(contact_message, format: :json)
end
