class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :b_start
      t.string :b_end
      t.string :s_time
      t.string :e_time
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
