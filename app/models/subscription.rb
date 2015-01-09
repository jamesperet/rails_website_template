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
  
  def subscribe_to_mailchimp
    Resque.enqueue(SubscribeToMailchimp, self.id)
  end
  
end
