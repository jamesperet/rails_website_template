# TESTS

Given(/^I am logged in as user$/) do
  user_login
end

Given(/^I am logged in as admin$/) do
  admin_login
end

Then(/^I log in as admin$/) do
  admin_login
end

Then(/^I log in as user$/) do
  user_login
end

Given(/^I am not logged in$/) do
  logout(:user)
#  current_driver = Capybara.current_driver
#  begin
#    Capybara.current_driver = :rack_test
#    page.driver.submit :delete, "/logout", {}
#  ensure
#    Capybara.current_driver = current_driver
#  end
end

Then(/^I log out$/) do
  logout(:user)
#  current_driver = Capybara.current_driver
#  begin
#    Capybara.current_driver = :rack_test
#    page.driver.submit :delete, "/logout", {}
#  ensure
#    Capybara.current_driver = current_driver
#  end
end

Given(/^the user "(.*?)" "(.*?)" with email "(.*?)" and password "(.*?)" exists$/) do |arg1, arg2, arg3, arg4|
  user_hash = { "first_name" => arg1, "last_name" => arg2, "email" => arg3, "password" => arg4 }
  if User.find_by_email(arg3) == nil
    user = FactoryGirl.create(:user, user_hash) 
  end
  if User.last.email != arg3
    return false
  end
end

# Fixes for devise post bug

Then(/^I log in with the email "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  fill_in "user_email", :with => arg1
  fill_in "user_password", :with => arg2
  click_button "Submit"
  page.driver.submit :post, new_user_session_path(:user => {email: arg1, password: arg2}), {}
end

When(/^I submit the login form$/) do
  click_button "Submit"
  page.driver.submit :post, user_registration_path(:user => {first_name: "Monty", last_name: "Cantsin", email: "monty_cantsin@canada.com", password: "12345678", password_confirmation: "12345678"}), {}
end

When(/^I submit the password reset form$/) do
  click_button "Reset Password"
  page.driver.submit :post, reset_password_path(:user => {email: "monty_cantsin@canada.com"}), {}
end

Then(/^I submit the new password form$/) do
  #click_button "Save Password"
  token = URI.parse(current_url).to_s.split('=').last
  #puts token
  page.driver.submit :put, user_password_path(:user => {password: "87654321", password_confirmation: "87654321", reset_password_token: token}), {}
end

# METHODS

def user_login
  if User.find_by_first_name("John") == nil
    user = FactoryGirl.create(:user)
  end  
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