class ChangeUnitPriceToFloatInInventory < ActiveRecord::Migration[7.0]
  # Reference: https://tosbourn.com/rails-migrate-change-column-type/
  def up
    change_column :inventories, :unit_price, :float
  end

  def down
    change_column :inventories, :unit_price, :string
  end
end
