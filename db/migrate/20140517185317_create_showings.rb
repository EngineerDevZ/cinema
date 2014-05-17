class CreateShowings < ActiveRecord::Migration
  def change
    create_table :showings do |t|
      t.decimal :price
      t.datetime :date
      t.boolean :is3d
      t.integer :vat
      t.integer :movie_id
      t.integer :room_id
      t.integer :showing_status_id

      t.timestamps
    end
  end
end
