class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.boolean :late
      t.boolean :unexcused_absences
      t.boolean :excused_absences

      t.timestamps null: false
    end
  end
end
