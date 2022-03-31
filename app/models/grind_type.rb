class GrindType < ApplicationRecord
  # Association
  # has_many :orders

  # Validation
  validates :grind, presence: true, uniqueness: true, length: { in: 4..20 }
end
