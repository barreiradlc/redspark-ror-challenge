require 'factory_bot_rails'

10.times do
  FactoryBot.create(:proponent)
end

puts "Seed data has been generated!"