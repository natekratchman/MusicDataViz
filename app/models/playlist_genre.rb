class PlaylistGenre < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :genre
end
