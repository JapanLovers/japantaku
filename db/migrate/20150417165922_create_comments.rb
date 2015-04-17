class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :date
      t.string :content

      t.timestamps null: false
    end
  end
end
