class Employee < ApplicationRecord
  # Association
  has_many :orders, dependent: nil
  belongs_to :job

  # Validation
  validates :f_name, :l_name, :phone_num, :email, presence: true
  validates :email,
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  # Email format reference 1: https://www.youtube.com/watch?v=l-Jv5vMjB70
  # Email format reference 2: https://rubular.com/

  # IMAGE PROCESSING
  validates :image, presence: true
  has_one_attached :image # Active Storage
end
