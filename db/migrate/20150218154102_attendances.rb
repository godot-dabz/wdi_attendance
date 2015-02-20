class Attendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :absence_type
      t.date :date
      t.references :student, null: false
      t.timestamps
    end
  end
end
