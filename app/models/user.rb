require 'rspotify'

class User < ActiveRecord::Base
  has_many :playlists
  
  has_many :playlist_artists, through: :playlists
  has_many :artists, through: :playlist_artists
  
  has_many :playlist_tracks, through: :playlists
  has_many :tracks, through: :playlist_tracks

  has_many :playlist_genres, through: :playlists
  has_many :genres, through: :playlist_tracks

  after_create :hello

  def initialize(spotify_user_id)
    @spotify_user_id = spotify_user_id
    # User.create(spotify_user_id: spotify_user_id) if User.find_by(spotify_user_id: spotify_user_id).nil?
  end

  def spotify
    "It worked!"
  end

  def hello
    puts "Hey there!"
  end

  def get_user_info
    @user = RSpotify::User.find("#{@spotify_user_id}")
    @name = @user.diplay_name
  end

  def user_playlist_ids
    @all_playlist_ids = @user.playlists.collect {|playlist| playlist.id}
  end

  def get_full_playlists
    @full_playlists = @all_playlist_ids.collect {|spotify_playlist_id| RSpotify::Playlist.find("#{@spotify_user_id}", "#{spotify_playlist_id}")}
  end

  def get_artists_in_playlists
    @artist_names = []
    @full_playlists.each do |playlist|
      playlist.tracks.each do |track|
        track.artists.each do |artist|
          @artist_names << artist.name
        end
      end
    end
  end

  def count_artists
    @artist_names.each_with_object(Hash.new(0)) {|name, h| h[name] += 1}
  end

# Database methods

  def self.add_to_db
    self.update(name: @name, spotify_user_id: @spotify_user_id)
  end

  def create_artist
    @artist_names.uniq.each do |artist|
      Artist.create(name: artist.name)
    end
  end

  def create_playlist
    @all_playlist_ids.each do |spotify_playlist_id|
      Playlist.create(spotify_playlist_id: spotify_playlist_id)
    end
  end

end

# require 'rspotify'
# RSpotify.authenticate("ce33f36675d04c8eb33a81ce4967a501", "01ba7ef1a474410dba5d939f95b5681a")
# @user = RSpotify::User.find("1219093601")





>>>>>>> Add user methods, new migrations
