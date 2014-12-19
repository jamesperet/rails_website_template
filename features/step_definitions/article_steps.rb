Info.create( :website_name => 'Website', :tagline => 'A Ruby on Rails app template', :default_language => 'en' )

Given /^I have blog posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title| 
    BlogPost.create!(:title => title) 
  end
end

When(/^I go to the blog page$/) do
  visit blog_path
end

Then(/^I should see "(.*?)" And I should see "(.*?)"$/) do |arg1, arg2|
  page.should have_content(arg1)
  page.should have_content(arg2)
end