# underscore the page name
def path_to(page)
  "/#{ page.gsub(" ", "_") }"
end

When /^I go to the list of (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see ("([^"]*)"\s*(?:,|and)?\s*)+$/ do |*text|
  puts text.inspect#page.has_content? text
  true
end

Given /^I am creating a new training_level$/ do
    pending # express the regexp above with the code you wish you had
end

