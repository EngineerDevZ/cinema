class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :showing_id
      t.integer :discout_id
      t.integer :ticket_status_id

      t.timestamps
    end
  end
end
