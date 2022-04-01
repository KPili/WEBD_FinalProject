class OrderHistory < ApplicationRecord
  # Association
  belongs_to :order

  # Validation
  validates :order_date, :cart_total, presence: true
  validates :tax_rate, numericality: true, allow_blank: true
  validates :cart_total, numericality: { greater_than_or_equal_to: 0 }
end
