class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :url

      t.timestamps
    end
  end
end
