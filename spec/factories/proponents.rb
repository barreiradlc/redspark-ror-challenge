FactoryBot.define do
  factory :proponent do
    name { Faker::Name.name_with_middle }
    cpf { Faker::Number.number(digits: 11) }
    birth_date { Faker::Date.between(from: '2014-09-23', to: '1955-09-25') }
    adress { create(:adress) }
    phones { [ create { :phone }, create { :phone } ] }
    wage { Faker::Number.number(digits: 4) }
    inss_discount { Faker::Number.between(from: 87, to: 450) }
  end
end
