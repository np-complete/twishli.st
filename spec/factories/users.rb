FactoryGirl.define do
  factory :user do
    sequence(:uid)
    sequence(:screen_name) { |n| "user_#{n}" }
  end
end
