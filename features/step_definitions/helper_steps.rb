Then(/^I should see in the field "(.*?)" the text "(.*?)"$/) do |arg1, arg2|
  value = find_field(arg1).value
  value.should have_content(arg2)
end

Given(/^the website is configured$/) do
  configs = Info.all
  configs.each do |config|
    config.destroy
  end
  FactoryGirl.create(:info)
end

Given(/^Maintenance mode is activated$/) do
  Info.last.update(maintenance_mode: true, maintenance_title: 'Website under maintenance', maintenance_message: 'Please check back soon')
end

Given /^the following (.+) list ?$/ do |factory, table| 
  table.hashes.each do |hash| 
    FactoryGirl.create(factory, hash)
  end
end

Then(/^spit out the page HTML$/) do
  puts page.html
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^I go to (.+)$/ do |page_name|
  path_to(page_name)
end

Given /^I visit the "(.*)"/ do |place|
 visit "/#{place}"
end

When /^I visit the homepage$/ do
 visit ""
end

# File Upload

Then(/^I upload the file "(.*?)" to the field "(.*?)"$/) do |arg1, arg2|
  @test_file_path = File.expand_path(('../../spec/fixtures/' + arg1), File.dirname(__FILE__))
  attach_file arg2, @test_file_path 
end

# Check for image

Then(/^I should see the image "(.*?)"$/) do |image_name|
  page.should have_selector("img[src$='#{image_name}']")
end