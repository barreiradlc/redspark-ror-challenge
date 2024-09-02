require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { should validate_presence_of(:type) }
  it { should allow_value('personal').for(:type) }
  it { should allow_value('reference').for(:type) }
  it { should_not allow_value(:invalid).for(:type) }

  it { should validate_presence_of(:country_code) }
  it { should validate_presence_of(:state_code) }
  it { should validate_presence_of(:number) }
end
