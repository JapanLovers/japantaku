class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :users, :email, :email
  end
end
