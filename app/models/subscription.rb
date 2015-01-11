class Subscription < ActiveRecord::Base
  
  after_create do
    subscribe_to_mailchimp
    send_newsletter_subscription_email
    track_analytics
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
  
  def send_newsletter_subscription_email
    if User.find_by_email(self.email) == nil
      Resque.enqueue(SendNewsletterSubscription, self.id)
    end
  end
  
  def track_analytics
    # Mixpanel Tracking Analytics
    @analytics = Analytics.new(self.full_name)
    @analytics.track('Newsletter subscription')
  end
  
end
