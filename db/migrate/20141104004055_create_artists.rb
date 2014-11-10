class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :count
      t.integer :origin_artist_id
<<<<<<< HEAD
      t.integer :popularity

=======
      t.integer :spotify_popularity
      t.integer :size
>>>>>>> 97bfa057c0793daf0669cffed22c6da9506fedd8
      t.timestamps
    end
  end
end
