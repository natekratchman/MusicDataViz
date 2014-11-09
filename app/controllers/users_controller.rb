class UsersController < ApplicationController
  def spotify
    # @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # @spotify_user_id = spotify_user_id
    @spotify_user_info = RSpotify::User.find("#{@spotify_user_id}")

    if User.find_by(spotify_user_id: @spotify_user_id).nil?
      @user = User.create(spotify_user_id: @spotify_user_id, name: "#{@spotify_user_info.diplay_name}")
    end
    @user.call

    render :show
  end

  def show
  end
end



# # Now you can access user's private data, create playlists and much more

# # Access private data
# spotify_user.country #=> "US"
# spotify_user.email   #=> "example@email.com"

# # Create playlist in user's Spotify account
# playlist = spotify_user.create_playlist!('my-awesome-playlist')

# # Add tracks to a playlist in user's Spotify account
# tracks = RSpotify::Track.search('Know')
# playlist.add_tracks!(tracks)
# playlist.tracks.first.name #=> "Somebody That I Used To Know"

# # Access and modify user's music library
# spotify_user.save_tracks!(tracks)
# spotify_user.saved_tracks.size #=> 20
# spotify_user.remove_tracks!(tracks)

# # Check doc for more