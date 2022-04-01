class Employee < ApplicationRecord
  # Association
  # has_many :orders
  belongs_to :job

  # Validation
  validates :f_name, :l_name, :phone_num, :email, presence: true
  validates :phone_num, length: { in: 7..10 }
  validates :email, format: { with: /\A^[\w.\d]+@[\w.\d]+.[comrga]{2,3}$\z/ }
  # Email format reference 1: https://www.youtube.com/watch?v=l-Jv5vMjB70
  # Email format reference 2: https://rubular.com/
end
