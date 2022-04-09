class CreateProvinceTaxRates < ActiveRecord::Migration[7.0]
  def change
    create_table :province_tax_rates do |t|
      t.references :province, null: false, foreign_key: true
      t.references :tax_rate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
