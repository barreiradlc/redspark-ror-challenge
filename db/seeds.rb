require 'factory_bot_rails'

10.times do
  FactoryBot.create(:proponent)
end

pp Proponent.all

puts "Seed data has been generated!"