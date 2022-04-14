class CreateAbouts < ActiveRecord::Migration[7.0]
  def change
    create_table :abouts do |t|
      t.text :about_us
      t.text :mission
      t.text :vision

      t.timestamps
    end
  end
end
