class Artist < ActiveRecord::Base
  has_many :playlist_artists
  has_many :playlists, through: :playlist_artists

  has_many :artist_genres
  has_many :genres, through: :artist_genres

  has_many :related_artists, class_name: "Artist", foreign_key: "origin_artist_id"
  belongs_to :origin_artist, class_name: "Artist"

  has_many :tracks

  def self.add_to_db
    self.update(name: , count:, origin_artist_id: )
  end

end