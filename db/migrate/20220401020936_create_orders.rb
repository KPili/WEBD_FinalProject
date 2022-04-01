class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_num
      t.string :email
      t.float :cart_total
      t.references :employee, null: false, foreign_key: true
      t.references :grind_type, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
