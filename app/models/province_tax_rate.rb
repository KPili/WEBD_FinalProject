class ProvinceTaxRate < ApplicationRecord
  belongs_to :province
  belongs_to :tax_rate
end
