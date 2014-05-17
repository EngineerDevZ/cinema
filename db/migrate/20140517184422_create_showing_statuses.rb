class CreateShowingStatuses < ActiveRecord::Migration
  def change
    create_table :showing_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
