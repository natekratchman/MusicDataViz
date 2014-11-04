class PlaylistArtist < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :artist
end
