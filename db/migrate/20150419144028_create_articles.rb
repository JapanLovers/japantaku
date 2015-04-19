class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :articles, :title, unique: true
    add_foreign_key :articles, :users
  end
end
