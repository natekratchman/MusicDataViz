require 'rspotify'

class User < ActiveRecord::Base
  has_many :playlists
  
  has_many :playlist_artists, through: :playlists
  has_many :artists, through: :playlist_artists
  
  has_many :playlist_tracks, through: :playlists
  has_many :tracks, through: :playlist_tracks

  has_many :playlist_genres, through: :playlists
  has_many :genres, through: :playlist_tracks


  def initialize(spotify_user_id)
    @spotify_user_id = spotify_user_id
    @spotify_user_info = RSpotify::User.find("#{@spotify_user_id}")
  end

  def create_user
    if User.find_by(spotify_user_id: @spotify_user_id).nil?
      @user = User.create(spotify_user_id: @spotify_user_id, name: "#{@spotify_user_info.diplay_name}")
    end
  end

  def create_playlists
    @spotify_playlist_ids = @spotify_user_info.playlists.collect {|playlist| playlist.id}
    
    @spotify_playlist_ids.each do |spotify_playlist_id|
      if Playlist.find_by(spotify_playlist_id: spotify_playlist_id).nil?
        Playlist.create(spotify_playlist_id: spotify_playlist_id, user_id: @user.id) 
    end
  end

  def get_full_playlists
    @full_playlists = @spotify_playlist_ids.collect {|spotify_playlist_id| RSpotify::Playlist.find("#{@spotify_user_id}", "#{spotify_playlist_id}")}
  end

  def create_artists
    # @artist_info = {}
    @full_playlists.each do |playlist|
      playlist.tracks.each do |track|
        track.artists.each do |artist|
          if Artist.find_by(name: artist.name).nil?
            Artist.create(name: artist.name, count: 1)
          else
            @artist = Artist.find_by(name: artist.name)
            @new_count = @artist.count + 1
            @artist.update(count: @new_count)
          end
        end
      end
    end
  end


  # def count_artists
  #   @artist_names.each_with_object(Hash.new(0)) {|name, h| h[name] += 1}
  # end

  # def add_related_artists(artist_array)
  #   artist_array.each do |artist|
  #     self.related_artists << artist
  #   end
  # end

end
