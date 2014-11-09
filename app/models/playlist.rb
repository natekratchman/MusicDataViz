class Playlist < ActiveRecord::Base
  belongs_to :user
  
  has_many :playlist_artists
  has_many :artists, through: :playlist_artists

  has_many :playlist_tracks
  has_many :tracks, through: :playlist_tracks

  has_many :playlist_genres
  has_many :genres, through: :playlist_genres

end 