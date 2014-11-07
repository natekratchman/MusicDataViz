Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "CLIENT_ID", "CLIENT_SECRET", scope: 'playlist-read-private streaming user-library-read user-read-private'
end