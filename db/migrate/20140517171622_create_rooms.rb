class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :capacity
      t.integer :room_number

      t.timestamps
    end
  end
end
