class AddShortToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :short, :string
  end
end
