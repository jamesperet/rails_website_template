class Subscription < ActiveRecord::Base
  
  after_create do
      subscribe_to_mailchimp
  end
  
  def full_name
    return self.first_name.to_s + " " + self.last_name.to_s
  end
  
  def self.to_csv
      CSV.generate do |csv|
        csv << column_names
        all.each do |product|
          csv << product.attributes.values_at(*column_names)
        end
      end
  end
  
  def subscribe_to_mailchimp testing=false
    return true if (Rails.env.test? && !testing)
    list_id = ENV['MAILCHIMP_LIST_ID']
    response = Rails.configuration.mailchimp.lists.subscribe({
      id: list_id,
      email: {email: email},
      double_optin: false,
    })
    response
  end
  
end
