class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :company_rep
      t.string :email
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
