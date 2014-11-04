class CreatePlaylistArtists < ActiveRecord::Migration
  def change
    create_table :playlist_artists do |t|
      t.integer :playlist_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
