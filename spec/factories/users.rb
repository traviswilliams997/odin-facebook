FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "hello+#{n}@example.com"}
    first_name { }
    last_name {}
    created_at {"2023-15-09 00:032:56"}
  end
end
