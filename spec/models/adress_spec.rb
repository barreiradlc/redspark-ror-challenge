require 'rails_helper'

RSpec.describe Adress, type: :model do
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:neighborhood) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip_code) }
end
