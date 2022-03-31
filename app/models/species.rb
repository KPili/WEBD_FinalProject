class Species < ApplicationRecord
  # Association
  has_one :inventory_detail

  # Validation
  validates :name, presence: true, uniqueness: true, length: { is: 7 }
end
