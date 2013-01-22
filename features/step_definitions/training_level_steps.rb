Given /^I have tranining levels titled (.*)$/ do |traning_levels|
   traning_levels.split(',').each do |training_level|
     FactoryGirl.build(:training_level, :name => training_level)
   end
end

