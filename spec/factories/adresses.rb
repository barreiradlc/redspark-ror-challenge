FactoryBot.define do  
  factory :adress do
    street { Faker::Address.street_name } # street: string
	  number { Faker::Address.building_number } # number: string
	  neighborhood { Faker::Address.street_address } # neighborhood: string
	  city { Faker::Address.city } # city: string
	  state { Faker::Address.state } # state: string
	  zip_code { Faker::Address.zip_code } # zip_code: string
  end
end
