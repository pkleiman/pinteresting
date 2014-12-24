class AddUserIdToPins < ActiveRecord::Migration
  def change
    end
  add_column :pins, :user_id, :integer
    add_index :pins, :user_id
end
