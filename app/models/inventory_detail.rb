class InventoryDetail < ApplicationRecord
  belongs_to :inventory
  belongs_to :species
end
