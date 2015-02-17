class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, uniqueness: true
      t.string :password_digest, null: false
<<<<<<< HEAD
      t.timestamps 
      t.integer :auth_id, default: 3	
=======
      t.integer :auth_id, default: 3
      t.timestamps
>>>>>>> 653c7e99d1344d30b37a88d327ebe92e9b6be2f2
    end
  end
end
