FactoryGirl.define do
  factory :training_level do
    sequence(:name) {|n| "Test Area #{n}" }
    sequence(:short_name) {|n| "TA#{n}" }
    url ""
  end
end
