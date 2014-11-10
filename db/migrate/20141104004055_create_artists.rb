class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :count
      t.integer :origin_artist_id
      t.integer :spotify_popularity
      t.integer :size
      t.timestamps
    end
  end
end
