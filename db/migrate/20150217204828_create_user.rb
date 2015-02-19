class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,  null: false
      t.string :email, null: false, uniqueness: true
      t.string :type
      # t.string :password_digest

      # students belong to cohort, have one attendance
      t.references :cohort

      # instructors belong to cohort (above), belong to producer
      t.references :producer

      # producers have many instructors
      t.references :instructors

      t.timestamps
    end
  end
end
