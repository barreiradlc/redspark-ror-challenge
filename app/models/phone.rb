class Phone < ApplicationRecord
  enum :contact_type, [:personal, :reference], define_constants: true

  validates :contact_type, presence: true
  validates :country_code, presence: true
  validates :state_code, presence: true
  validates :number, presence: true

  belongs_to :proponent
end
