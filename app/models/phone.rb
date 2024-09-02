class Phone < ApplicationRecord
  enum :type, %i[personal reference], validate: true

  validates :type, presence: true
  validates :country_code, presence: true
  validates :state_code, presence: true
  validates :number, presence: true
end
