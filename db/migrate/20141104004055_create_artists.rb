class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :count
      t.integer :origin_artist_id

      t.timestamps
    end
  end
end
