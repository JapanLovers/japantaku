class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
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
  end
end
