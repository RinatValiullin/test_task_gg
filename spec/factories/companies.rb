FactoryBot.define do
  factory :company do
    sequence(:subject) { |n| "subject #{n}" }
    sequence(:message) { |n| "message #{n}" }
  end
end
