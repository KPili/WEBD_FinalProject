class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.text :job_desc
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
