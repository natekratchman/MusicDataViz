class Artist < ActiveRecord::Base
  has_many :playlist_artists
  has_many :playlists, through: :playlist_artists

  has_many :tracks
end
