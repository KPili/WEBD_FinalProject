class Supplier < ApplicationRecord
  # Association
  has_many :inventories
  belongs_to :job

  # Validation
  validates :company_name, :company_rep, :email, presence: true, uniqueness: true
  validates :email,
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  # Email format reference 1: https://www.youtube.com/watch?v=l-Jv5vMjB70
  # Email format reference 2: https://rubular.com/
end
