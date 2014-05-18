class CreateTicketSeatShowings < ActiveRecord::Migration
  def change
    create_table :ticket_seat_showings do |t|
      t.integer :ticket_id
      t.integer :seat_id
      t.integer :showing_id

      t.timestamps
    end
  end
end
