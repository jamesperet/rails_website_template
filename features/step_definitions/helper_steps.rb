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