#
# General

Then /^I should see error messages$/ do
  assert_match /with the following field/m, response.body
end

#
# Database

Given /^the following (.*) records$/ do |factory, table|
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

Given /^users are active$/ do
  User.find(:all).each do |user|
    user.activate!
  end
end

Given /^no (.*) exists with an email of "(.*)"$/ do |account, email|
  assert_nil account.titleize.gsub(" ", "").constantize.find_by_email(email)
end

#
# Session

Given /^I am logged in as a (backend|frontend) user with "(.*)\/(.*)"$/ do |user, email, password|
  Then 'I am on the login page'
  When "I fill in \"Email\" with \"#{email}\""
  And "I fill in \"Password\" with \"#{password}\""
  And "I press \"Login\""
  if user == 'backend'
    Then "I am on the dashboard page"
  else
    Then "I am on the start page"
  end
end


Then /^I am logged in$/ do
  assert controller.current_user
end

Then /^I am logged out$/ do
  assert !controller.current_user
end


# 
# Then /^I should be signed in$/ do
#   assert controller.signed_in?
# end
# 
# Then /^I should be signed out$/ do
#   assert ! controller.signed_in?
# end

When /^session is cleared$/ do
  request.reset_session
  controller.instance_variable_set(:@_current_user, nil)
end