class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :starts_on
      t.date :ends_on
      t.timestamps
    end
  end
end
