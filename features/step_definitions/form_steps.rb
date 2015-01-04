Then(/^I check the checkbox called "(.*?)"$/) do |arg1|
  check(arg1)
end

Then(/^I uncheck the checkbox called "(.*?)"$/) do |arg1|
  uncheck(arg1)
end