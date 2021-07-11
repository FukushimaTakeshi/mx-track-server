FactoryBot.define do
  factory :region do
    sequence(:name) { |n| "TEST_NAME#{n}" }
  end
end
