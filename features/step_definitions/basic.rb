Given /^I run the app$/ do
  visit("http://localhost:8888/")
end

Then /^I should see "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should not see "([^"]*)"$/ do |arg1|
  page.should_not have_content(arg1)
end

# When /^I insert the name "([^"]*)"$/ do |arg1|
#   fill_in('name', :with => arg1)
# end

When /^I insert the "([^"]*)" "([^"]*)"$/ do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When /^I click on "([^"]*)"$/ do |arg1|
#  require 'debug'
  find_link(arg1).click
end

When /^I click on Home$/ do
  find('.home-link').click
end

When /^I submit "([^"]*)"$/ do |arg1|
  click_on(arg1)
end

Given /^the following mates exist:$/ do |table|
  table.hashes.each do |hash|
    find_link("Mate").click
    fill_in('name', :with => hash[:name])
    click_on("submit-participant")
  end
end

When /^I select the mate "([^"]*)"$/ do |arg1|
  select(arg1, :from => 'Mate')
end

Given /^the following costs exist:$/ do |table|
  table.hashes.each do |hash|
    find_link("Cost").click
    fill_in('description', :with => hash[:description])
    fill_in('cost', :with => hash[:cost])
    select(hash[:mate], :from => 'Mate')
    click_on("submit")
  end
end

When /^I remove the cost "([^"]*)"$/ do |arg1|
  find_link("Costs").click
  find_link(arg1).click
  click_on("Remove")
  find_link("Yes, I'm really sure").click
end

When /^I remove the mate "([^"]*)"$/ do |arg1|
  find_link("Mates").click
  find_link(arg1).click
  click_on("Remove")
  find_link("Yes, I'm really sure").click
end

When /^I add the cost "([^"]*)" "([^"]*)" "([^"]*)"$/ do |arg1, arg2, arg3|
    find_link("Cost").click
    fill_in('description', :with => arg1)
    fill_in('cost', :with => arg2)
    select(arg3, :from => 'Mate')
    click_on("submit")
end

When /^I add the mate "([^"]*)"$/ do |arg1|
    find_link("Mate").click
    fill_in('name', :with => arg1)
    click_on("submit-participant")
end
