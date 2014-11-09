require 'rspotify'
require 'pry'

class User < ActiveRecord::Base
  has_many :playlists
  
  has_many :playlist_artists, through: :playlists
  has_many :artists, through: :playlist_artists
  
  has_many :playlist_tracks, through: :playlists
  has_many :tracks, through: :playlist_tracks

  has_many :playlist_genres, through: :playlists
  has_many :genres, through: :playlist_tracks

  def call
    create_playlists
    # get_full_playlists
    # create_artists
  end

  def create_playlists
    ## MAKE THIS VARIABLE
    user_id = 1219093601
    ###

    ## DELETE THIS
    RSpotify.authenticate("ce33f36675d04c8eb33a81ce4967a501", "01ba7ef1a474410dba5d939f95b5681a")
    spotify_user_info = RSpotify::User.find("#{user_id}")
    ###

    spotify_playlist_ids = spotify_user_info.playlists.collect {|playlist| playlist.id}
    
    spotify_playlist_ids.each do |spotify_playlist_id|
      if Playlist.find_by(spotify_playlist_id: spotify_playlist_id).nil?
        @db_playlist = Playlist.create(spotify_playlist_id: spotify_playlist_id, user_id: self.id)
      else
        @db_playlist = Playlist.find_by(spotify_playlist_id: spotify_playlist_id)
      end
      create_artists(spotify_playlist_ids, @db_playlist)
    end
  end

  #change first param to "#{@spotify_user_id}"
  def create_artists(spotify_playlist_ids, db_playlist)
    spotify_playlist_ids.each do |spotify_playlist_id|
      ## MAKE THIS VARIABLE
      user_id = 1219093601
      ###
      playlist = RSpotify::Playlist.find("#{user_id}", "#{spotify_playlist_id}") 
      playlist.tracks.each do |track|
        track.artists.each do |artist|
          if Artist.find_by(name: artist.name).nil?
            @artist = Artist.create(name: artist.name, count: 1)
            PlaylistArtist.create(playlist_id: db_playlist.id, artist_id: @artist.id)
            create_genres(artist.id, db_playlist.id)
          else
            @artist = Artist.find_by(name: artist.name)
            new_count = @artist.count + 1
            @artist.update(count: new_count)
          end
        end
      end
    end
  end

  #change first param to "#{@spotify_user_id}"
  def create_genres(artist_id, db_playlist_id)
    artist = RSpotify::Artist.find("#{artist_id}")

    artist.genres.each do |genre|
      if Genre.find_by(name: genre).nil?
        @genre = Genre.create(name: genre, count: 1)
        PlaylistGenre.create(playlist_id: db_playlist_id, genre_id: @genre.id)
       else
         @genre = Genre.find_by(name: genre)
         new_count = @genre.count + 1
         @genre.update(count: new_count)
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


# user = RSpotify::User.find("1219093601")
# RSpotify.authenticate("ce33f36675d04c8eb33a81ce4967a501", "01ba7ef1a474410dba5d939f95b5681a")
# @spotify_playlist_ids = user.playlists.collect {|playlist| playlist.id}

# @playlist = RSpotify::Playlist.find("1219093601", "3IdE2oeayCdU4TFAwEbZhv") 