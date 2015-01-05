include Warden::Test::Helpers

Given /^the following list of blog posts?$/ do |table| 
  user = FactoryGirl.create(:user) 
  table.hashes.each do |hash| 
    post = FactoryGirl.create("blog_post", hash)
    post.author = user
    post.save
  end
end
  
Given /^I have blog posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title| 
    BlogPost.create!(:title => title) 
  end
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

Then(/^the page should have a "(.*?)" called "(.*?)"$/) do |arg1, arg2|
  selector = arg1 + '#' + arg2
  page.should have_css(selector)
end

Then(/^the page should not have a "(.*?)" called "(.*?)"$/) do |arg1, arg2|
  selector = arg1 + '#' + arg2
  page.should have_no_css(selector)
end

When(/^I click in the link "(.*?)"$/) do |arg1|
  click_link arg1
end

When(/^I click in the button "(.*?)"$/) do |arg1|
  click_button arg1
end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end
