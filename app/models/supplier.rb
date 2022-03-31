class Supplier < ApplicationRecord
  # Association
  has_many :inventories
  belongs_to :job

  # Validation
  validates :company_name, :company_rep, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A^[\w.\d]+@[\w.\d]+.[comrga]{2,3}$\z/ }
  # Email format reference 1: https://www.youtube.com/watch?v=l-Jv5vMjB70
  # Email format reference 2: https://rubular.com/
end
