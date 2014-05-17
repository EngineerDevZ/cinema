class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :description
      t.integer :duration
      t.integer :genre_id

      t.timestamps
    end
  end
end
