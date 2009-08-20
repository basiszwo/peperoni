#
# use with factory girl
# gives you steps like these asuming having factories present
# e.g.
# Given a post exists with a title of "Super Post" 
# Given an author exists with an email of "user@example.com" 
# Given a comment exists with a title of "Bad Comment"
Factory.factories.each do |name, factory|
  Given /^an? #{name} exists with an? (.*) of "([^"]*)"$/ do |attr, value|
    Factory(name, attr.gsub(' ', '_') => value)
  end
end