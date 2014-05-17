class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :sector
      t.integer :row
      t.integer :number
      t.integer :room_id

      t.timestamps
    end
  end
end
