class Subscription < ActiveRecord::Base
  
  def full_name
    return self.first_name + " " + self.last_name
  end
  
  def self.to_csv
      CSV.generate do |csv|
        csv << column_names
        all.each do |product|
          csv << product.attributes.values_at(*column_names)
        end
      end
  end
  
end
