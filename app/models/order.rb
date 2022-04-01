class Order < ApplicationRecord
  # Association
  belongs_to :employee
  belongs_to :grind_type
  belongs_to :province

  # Validations
  validates :order_num, :cart_total, presence: true
  validates :order_num, uniqueness: true
  validates :cart_total, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :email, format: { with: /\A^[\w.\d]+@[\w.\d]+.[comrga]{2,3}$\z/ }, allow_blank: true
  # Email format reference 1: https://www.youtube.com/watch?v=l-Jv5vMjB70
  # Email format reference 2: https://rubular.com/
end
