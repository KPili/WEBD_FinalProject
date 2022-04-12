class TaxRate < ApplicationRecord
  # Association

  # Validation
  validates :applicable, numericality: true, presence: true
  validates :gst, :pst, :hst, numericality: true, allow_blank: true
end
