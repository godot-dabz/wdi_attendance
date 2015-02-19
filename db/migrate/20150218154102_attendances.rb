class Attendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :email, null: false
      t.date :late
      t.date :unexcused_absences
      t.date :excused_absences
      t.references :student
      t.timestamps
    end
  end
end
