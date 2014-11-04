class Genre < ActiveRecord::Base
  has_many :artist_genres
  has_many :artists, through: :artist_genres

  has_many :playlist_genres
  has_many :playlists, through: :playlist_genres
end
