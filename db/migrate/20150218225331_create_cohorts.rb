class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      # t.references :instructors
      # t.references :students
    end
  end
end
