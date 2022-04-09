class TaxRate < ApplicationRecord
  # Association
  has_many :province_tax_rates
  has_many :provinces, through: :province_tax_rates

  # Validation
  validates :gst, :pst, :hst, :total, numericality: true, allow_blank: true
end
