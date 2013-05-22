class AddKeyTitleToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :key, :string
    add_column :rooms, :title, :string
  end
end
