require 'factory_girl'

FactoryGirl.define do 
  
  factory :user, aliases: [:author, :owner] do
    first_name    "John"
    last_name     "Doe"
    email         "johndoe@website.com"
    password      "12345678"    
  end
  
  factory :blog_post do |f|
    f.title "foo"  
    f.slug "foo"
    f.content "foobar"  
    f.published true
    f.description "foobar is cool" 
    association :author, factory: :user, last_name: "Doe", strategy: :build
  end 
  
end  

