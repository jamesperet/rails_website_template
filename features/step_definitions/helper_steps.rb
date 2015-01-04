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
