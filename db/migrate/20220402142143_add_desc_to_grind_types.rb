class AddDescToGrindTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :grind_types, :desc, :text
  end
end
