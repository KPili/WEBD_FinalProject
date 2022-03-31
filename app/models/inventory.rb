class Inventory < ApplicationRecord
  # Association
  belongs_to :supplier

  # Validation
  validates :item_name, :unit_sold, :unit_price, :stock_amount, :new_inventory, :total,
            presence: true
  validates :unit_sold, :unit_price, :stock_amount, :total, numericality: true
  validates :unit_sold, :unit_price, :stock_amount, :total,
            numericality: { greater_than_or_equal_to: 0 }
  validates :stock_amount, numericality: { only_integer: true }
  validates :retail_total, numericality: true, comparison: { greater_than: :total },
allow_blank: true
end
