class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :email
      t.string  :password_digest
      t.integer :role
      t.string  :password_reset_digest
      t.string  :activation_digest
      t.boolean :activated , :default => false 

      t.timestamps
    end
  end
end
