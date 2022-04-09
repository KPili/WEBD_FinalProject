class RemoveTaxRateFromProvinces < ActiveRecord::Migration[7.0]
  def change
    remove_reference :provinces, :tax_rate, null: false, foreign_key: true
  end
end
