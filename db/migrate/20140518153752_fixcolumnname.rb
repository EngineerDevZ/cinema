class Fixcolumnname < ActiveRecord::Migration
  def change
    rename_column :tickets, :discout_id, :discount_id
  end
end
