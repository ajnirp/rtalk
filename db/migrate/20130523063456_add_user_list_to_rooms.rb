class AddUserListToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :user_list, :text, :default => ""
  end
end
