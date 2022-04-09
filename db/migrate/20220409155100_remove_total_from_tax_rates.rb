class RemoveTotalFromTaxRates < ActiveRecord::Migration[7.0]
  def change
    remove_column :tax_rates, :total, :float
  end
end
