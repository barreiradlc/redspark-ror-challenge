class Adress < ApplicationRecord
  validates :street, presence: true
  validates :number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  belongs_to :proponent, optional: true
end
