class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :pseudo
      t.references :comment, index: true
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :comments
    add_foreign_key :comments, :articles
  end
end
