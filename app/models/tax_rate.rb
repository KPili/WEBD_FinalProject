class TaxRate < ApplicationRecord
  # Association
  has_many :provinces

  # Validation
  validates :gst, :pst, :hst, numericality: true, allow_blank: true
end
