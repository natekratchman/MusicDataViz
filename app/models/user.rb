class User < ActiveRecord::Base
  has_many :playlists
  
  has_many :playlist_artists, through: :playlists
  has_many :artists, through: :playlist_artists
  
  has_many :playlist_artists, through: :playlists
  has_many :tracks, through: :playlist_tracks
end
