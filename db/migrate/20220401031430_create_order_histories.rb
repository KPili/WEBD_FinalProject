class CreateOrderHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :order_histories do |t|
      t.date :order_date
      t.float :cart_total
      t.float :tax_rate
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
