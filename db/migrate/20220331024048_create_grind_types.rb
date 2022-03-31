class CreateGrindTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :grind_types do |t|
      t.string :grind

      t.timestamps
    end
  end
end
