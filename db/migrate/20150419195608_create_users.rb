class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :pseudo
      t.text :desc
      t.integer :age
      t.string :avatar_name
      t.string :last_name
      t.string :first_name
      t.string :pwd
      t.boolean :is_admin
      t.string :salt

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :pseudo, unique: true
  end
end
