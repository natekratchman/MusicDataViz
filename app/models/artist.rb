class Artist < ActiveRecord::Base
  has_many :playlist_artists
  has_many :playlists, through: :playlist_artists

  has_many :artist_genres
  has_many :genres, through: :artist_genres

  has_many :tracks
end
