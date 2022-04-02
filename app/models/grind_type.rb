class GrindType < ApplicationRecord
  # Association
  has_many :orders

  # Validation
  validates :desc, presence: true
  validates :grind, presence: true, uniqueness: true, length: { in: 4..20 }
end
