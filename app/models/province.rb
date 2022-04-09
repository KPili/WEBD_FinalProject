class Province < ApplicationRecord
  # Association
  has_many :orders
  has_many :province_tax_rates
  has_many :tax_rates, through: :province_tax_rates

  # Validation
  validates :province_code, :province_name, presence: true
  validates :province_code, length: { is: 2 }
  validates :province_name, length: { maximum: 25 }
end
