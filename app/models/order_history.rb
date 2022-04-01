class OrderHistory < ApplicationRecord
  # Association
  belongs_to :order

  # Validation
  validates :order_date, :cart_total, :tax_rate, presence: true
  validates :cart_total, numericality: { greater_than_or_equal_to: 0 }
end
