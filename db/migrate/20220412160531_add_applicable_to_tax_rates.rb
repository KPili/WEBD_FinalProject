class AddApplicableToTaxRates < ActiveRecord::Migration[7.0]
  def change
    add_column :tax_rates, :applicable, :float
  end
end
