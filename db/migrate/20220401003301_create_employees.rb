class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :f_name
      t.string :l_name
      t.string :phone_num
      t.string :email
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
