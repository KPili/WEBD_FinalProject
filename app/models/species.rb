class Species < ApplicationRecord
  # Association
  has_many :inventory_details, dependent: nil

  # Validation
  validates :name, presence: true, uniqueness: true, length: { is: 7 }
end
