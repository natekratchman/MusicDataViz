Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "ce33f36675d04c8eb33a81ce4967a501", "01ba7ef1a474410dba5d939f95b5681a", scope: 'playlist-read-private streaming user-library-read user-read-private'
end