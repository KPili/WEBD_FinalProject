class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :province_code
      t.string :province_name
      t.references :tax_rate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
