class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :pseudo
      t.string :desc
      t.integer :age
      t.string :avatar
      t.string :last_name
      t.string :first_name
      t.string :pwd

      t.timestamps null: false
    end
    add_index :admins, :email, unique: true
    add_index :admins, :pseudo, unique: true
  end
end
