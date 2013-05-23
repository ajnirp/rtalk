class AddKeyUniquenessIndex < ActiveRecord::Migration
  def up
  	add_index :rooms, :key, :unique => true
  	# chances of two rooms having the same key are very low, but this is still a good idea
  end

  def down
  	remove_index :rooms, :key
  end
end
