require 'rails_helper'

RSpec.describe Proponent, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:adress) }
  it { should validate_presence_of(:phones) }
  it { should validate_presence_of(:wage) }
  it { should validate_presence_of(:inss_discount) }              
end
