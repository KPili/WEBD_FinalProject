class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :grind_type
  belongs_to :province
end
