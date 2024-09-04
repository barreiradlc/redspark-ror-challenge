class Proponent < ApplicationRecord
  has_many :phones
  has_one :adress
  
  validates :name, presence: true
  validates :cpf, presence: true
  validates :birth_date, presence: true
  validates :wage, presence: true
  validates :inss_discount, presence: true
  
  validates :adress, presence: true
  validates :phones, presence: true
  
  accepts_nested_attributes_for :phones, :adress
end
