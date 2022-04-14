class About < ApplicationRecord
  # validations
  validates :about_us, :mission, :vision, presence: true
end
