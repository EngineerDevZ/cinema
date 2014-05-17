class ChangeIntegerFormatInSeats < ActiveRecord::Migration
  def change
	change_column :seats, :row, :string
  end
end
