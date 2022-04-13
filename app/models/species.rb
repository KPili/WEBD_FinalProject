class Species < ApplicationRecord
  # Association
  has_many :inventory_details

  # Validation
  validates :name, presence: true, uniqueness: true, length: { is: 7 }
end
