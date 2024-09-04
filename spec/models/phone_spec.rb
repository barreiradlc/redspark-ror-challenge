require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { should validate_presence_of(:contact_type) }  
  it { should define_enum_for(:contact_type).with_values([:personal, :reference]) }
  it { should validate_presence_of(:country_code) }
  it { should validate_presence_of(:state_code) }
  it { should validate_presence_of(:number) }
end
