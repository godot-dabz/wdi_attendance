class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, uniqueness: true
      t.string :password_digest, null: false
      t.integer :auth_id, default: 3
      t.timestamps
    end
  end
end
