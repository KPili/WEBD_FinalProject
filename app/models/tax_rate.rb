class TaxRate < ApplicationRecord
  # Association
  has_many :provinces, dependent: nil

  # Validation
  validates :applicable, numericality: true, presence: true
  validates :gst, :pst, :hst, numericality: true, allow_blank: true
end
