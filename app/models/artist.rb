class Artist < ActiveRecord::Base
  has_many :playlist_artists
  has_many :playlists, through: :playlist_artists

  has_many :artist_genres
  has_many :genres, through: :artist_genres

  # has_many :artist_related_artists
  # has_many :related_artists, through: :artist_related_artists
  # has_many :inverse_artist_related_artists, class_name: "ArtistRelatedArtist", foreign_key: "related_artist_id"
  # has_many :inverse_related_artists, through: :inverse_artist_related_artists, source: :artist

  has_many :related_artists, class_name: "Artist", foreign_key: "origin_artist_id"
  belongs_to :origin_artist, class_name: "Artist"

  has_many :tracks

  def add_related_artists(artist_array)
    artist_array.each do |artist|
      # ArtistRelatedArtist.create(artist_id: self.id, related_artist_id: artist.id)
      
      self.related_artists << artist
    end
  end

end