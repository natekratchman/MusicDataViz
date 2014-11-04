class CreatePlaylistGenres < ActiveRecord::Migration
  def change
    create_table :playlist_genres do |t|
      t.integer :playlist_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
