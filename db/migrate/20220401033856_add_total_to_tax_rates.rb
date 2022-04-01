class AddTotalToTaxRates < ActiveRecord::Migration[7.0]
  def change
    add_column :tax_rates, :total, :float
  end
end
