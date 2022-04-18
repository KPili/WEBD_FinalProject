class InventoryDetail < ApplicationRecord
  # Association
  belongs_to :inventory
  belongs_to :species

  # Validation
  validates :aroma, :flavor, :acidity, numericality: true, allow_blank: true
  validates :on_sale, numericality: { only_integer: true }
  validates :aroma, :flavor, :acidity, numericality: { greater_than_or_equal_to: 0 },
                                       allow_blank:  true
  validates :country_of_origin, presence: true

  # Kaminari Pagination
  paginates_per 16
end
