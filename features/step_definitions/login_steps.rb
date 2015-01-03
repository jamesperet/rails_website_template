Given(/^I am logged in as user$/) do
  user_login
end

Given(/^I am logged in as admin$/) do
  admin_login
end

Then(/^I log in as admin$/) do
  admin_login
end

def user_login
  user = FactoryGirl.create(:user)  
  visit new_user_session_path  
  fill_in "Email", :with => 'johndoe@website.com' 
  fill_in "Password", :with => '12345678' 
  click_button "Submit"
  login_as user, scope: :user
  visit root_path
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