class CreateInventoryDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_details do |t|
      t.float :aroma
      t.float :flavor
      t.float :acidity
      t.string :country_of_origin
      t.boolean :on_sale
      t.references :inventory, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
