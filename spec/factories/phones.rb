FactoryBot.define do
  factory :phone do
    contact_type { ["personal", "reference"].sample }
    country_code { Faker::PhoneNumber.country_code }
    state_code { Faker::Number.number(digits: 2) }
    number { Faker::Number.between(from: 900000000, to: 999999999) }
  end
end
  