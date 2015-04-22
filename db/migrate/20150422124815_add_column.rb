class AddColumn < ActiveRecord::Migration
  def change
  	add_column :comments, :user_id, :user 
  end
end
