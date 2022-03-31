class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :item_name
      t.string :unit_sold
      t.string :unit_price
      t.integer :stock_amount
      t.boolean :new_inventory
      t.float :total
      t.float :retail_total
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
