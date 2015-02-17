class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null:false, uniqueness: true
      t.integer :auth_level, default: 3
      t.string :password_digest

      t.timestamps
    end
  end
end
