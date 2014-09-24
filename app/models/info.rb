class Info < ActiveRecord::Base
  validates_presence_of :website_name, :default_language
end
