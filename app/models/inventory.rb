class Inventory < ApplicationRecord
  # Association
  has_many :inventory_details, dependent: nil
  belongs_to :supplier

  # Validation
  validates :item_name, :unit_sold, :unit_price, :stock_amount, :total, presence: true
  validates :unit_sold, :unit_price, :stock_amount, :total,
            numericality: { greater_than_or_equal_to: 0 }
  validates :stock_amount, :new_inventory, numericality: { only_integer: true }
  validates :retail_total, numericality: true, allow_blank: true

  # Kaminari Pagination
  paginates_per 16

  # IMAGE PROCESSING
  validates :image, presence: true
  has_one_attached :image # Active Storage
end
