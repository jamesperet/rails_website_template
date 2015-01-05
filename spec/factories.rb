require 'factory_girl'

FactoryGirl.define do 
  
  factory :user, aliases: [:author] do |f|
    f.first_name "John"
    f.last_name  "Doe"
    f.email      "johndoe@website.com"
    f.password   "12345678"
    f.admin      false
  end
  
  factory :admin, class: User do 
    first_name "admin" 
    email      "admin@website.com"
    password   "12345678"
    admin      true
  end
  
  factory :blog_post do |f|
    f.title "foo"  
    f.slug "foo"
    f.content "foobar"  
    f.published true
    f.description "foobar is cool" 
  end 
  
  factory :info do
    website_name 'Rails Website Template'
    tagline 'A Ruby on Rails app template'
    default_language 'en'
    contact_email 'admin@website.com'
    server_email 'no-reply@website.com'
    website_link 'http://localhost:3000'
  end
  
  factory :subscription do |f|
    f.first_name "foo"  
    f.last_name "bar"
    f.email "foobar@website.com"
  end 
  
end  

