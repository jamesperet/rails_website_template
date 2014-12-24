include Warden::Test::Helpers

Info.create( :website_name => 'Website', :tagline => 'A Ruby on Rails app template', :default_language => 'en' )

Given /^the following (.+) list ?$/ do |factory, table| 
  user = FactoryGirl.create(:user) 
  table.hashes.each do |hash| 
    post = FactoryGirl.create(factory, hash)
    post.author = user
    post.save
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

Then(/^The current url should be "(.*?)"$/) do |arg1|
  uri = URI.parse(current_url)
  "#{uri.path}".should == arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  page.should have_no_content(arg1)
end

Then(/^I should see the link "(.*?)"$/) do |arg1|
  find_link(arg1).visible?
end

Then(/^I should not see the link "(.*?)"$/) do |arg1|
  assert has_no_link?(arg1)
end

Then(/^I should see "(.*?)" And I should see "(.*?)"$/) do |arg1, arg2|
  page.should have_content(arg1)
  page.should have_content(arg2)
end

When(/^I click in the link "(.*?)"$/) do |arg1|
  click_link arg1
end

When(/^I click in the button "(.*?)"$/) do |arg1|
  click_button arg1
end

Given(/^I am logged in as admin$/) do
  admin_login
end

Then(/^I log in as admin$/) do
  admin_login
end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end

def admin_login
  user = FactoryGirl.create(:admin)  
  visit new_user_session_path  
  fill_in "Email", :with => 'admin@website.com' 
  fill_in "Password", :with => '12345678' 
  click_button "Submit"
  login_as user, scope: :user
  visit root_path
end