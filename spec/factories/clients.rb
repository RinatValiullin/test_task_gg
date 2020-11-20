FactoryBot.define do
  factory :client do
    sequence(:email) { |n| "test#{n}@test.com" }
    companies { [] }
  end
end
