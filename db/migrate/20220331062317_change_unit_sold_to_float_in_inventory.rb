class ChangeUnitSoldToFloatInInventory < ActiveRecord::Migration[7.0]
  # Reference: https://tosbourn.com/rails-migrate-change-column-type/
  def up
    change_column :inventories, :unit_sold, :float
  end

  def down
    change_column :inventories, :unit_sold, :string
  end
end
