Info.create( :website_name => 'Website', :tagline => 'A Ruby on Rails app template', :default_language => 'en' )

Given /^the following (.+) list ?$/ do |factory, table| 
  table.hashes.each do |hash| 
    FactoryGirl.create(factory, hash) 
  end
end
  
Given /^I have blog posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title| 
    BlogPost.create!(:title => title) 
  end
end

When /^I go to (.+)$/ do |page_name|
  path_to(page_name)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should see "(.*?)" And I should see "(.*?)"$/) do |arg1, arg2|
  page.should have_content(arg1)
  page.should have_content(arg2)
end

When(/^I click in the link "(.*?)"$/) do |arg1|
  click_link arg1
end
