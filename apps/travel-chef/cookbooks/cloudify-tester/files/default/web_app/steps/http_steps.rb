# Setup
#
# Some WWW access features/steps can take a while:
#
Before do
  @aruba_timeout_seconds.nil? || @aruba_timeout_seconds < 30 ? @aruba_timeout_seconds = 10 : @aruba_timeout_seconds
end

Given /^I am HTTP digest authenticated with the following credentials:$/ do |table|
  attrs    = table.hashes.first
  username = attrs["username"]
  password = attrs["password"]

  basic_auth(username, password)
end

# Actions
When /^I go to "(.*)"$/ do |path|
  begin
    visit(path, @http_method || "get")
  rescue Exception => e
    @error = e
  end
end

When /^I press "(.*)"$/ do |button|
  click_button(button)
end

When /^I follow "(.*)"$/ do |link|
  click_link(link)
end

When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I select "(.*)" from "(.*)"$/ do |value, field|
  select(value, :from => field)
end

When /^I check "(.*)"$/ do |field|
  check(field)
end

When /^I uncheck "(.*)"$/ do |field|
  uncheck(field)
end

When /^I choose "(.*)"$/ do |field|
  choose(field)
end

When /^I submit the form named "(.*)"$/ do |name|
  submit_form(name)
end

When /^I attach the file at "(.*)" to "(.*)" $/ do |path, field|
  attach_file(field, path)
end

# Results
Then /^I should see "(.*)"$/ do |text|
  response.body.to_s.should =~ /#{text}/m
end

Then /^I should not see "(.*)"$/ do |text|
  response.body.to_s.should_not =~ /#{text}/m
end

Then /^I should see an? (\w+) message$/ do |message_type|
  response.should have_xpath("//*[@class='#{message_type}']")
end

Then /^the (.*) ?request should succeed/ do |_|
  success_code?.should be_true
end

Then /^the (.*) ?request should fail/ do |_|
  success_code?.should be_false
end

Then /^the (.*) ?request should not be authorized/ do |_|
  @error.should be_an_instance_of Mechanize::ResponseCodeError
  %w(401 403).should include @error.response_code
end

Then /^(?:the request|I) should be redirected to "([^"]*?)"$/ do |redirect_url|
  redirect?.should == true and response_location.should == redirect_url
end
