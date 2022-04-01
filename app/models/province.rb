class Province < ApplicationRecord
  # Association
  # has_many :orders
  belongs_to :tax_rate

  # Validation
  validates :province_code, :province_name, presence: true
  validates :province_code, length: { is: 2 }
  validates :province_name, length: { maximum: 25 }
end
