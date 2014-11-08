Rails.application.routes.draw do
  
  resources :users, :only => [:show] do
    resources :groups, :only => [:index, :show]
  end
  # Prefix        Verb  URI                          Controller#Action
  # user_groups   GET   /users/:user_id/groups       groups#index
  # user_group    GET   /users/:user_id/groups/:id   groups#show
  # user          GET   /users/:id                   users#show



  get '/login' => 'sessions#new'
  get '/auth/spotify/callback', to: 'sessions#create'
  # post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  root 'users#show'
  
  # get '/auth/spotify/callback', to: 'users#spotify'

  # data that Spotify returns to us
  # 'code' and 'state' in params
  # http://localhost:3000/auth/spotify/callback?code=AQCK2bF5lh2TEcAXmstEh5OBQNECsVhAzWdYhMiWRgZwEQD5yRUfhT7v10J7TvPOh-xSnoS7PAgm_49Vq_iRKDFiaDNQKVhSTEmAKa3ex07RV3WP98q3QSqWCxrWxWrec8bv4wYFNQv31HOGKe-YBlXW357ZTsHs46AsJ01BoQwOpJByaB4puzoUNC36WCqAlRwq7_UDmpHy1GOIHazJPafZfYAiQ-9l9CQC971BMsR_SDfxjIAkv4XtT_92ND8Qe2B-Lm6FntO7ni3VigT49Y88Cz3BRWmF5GKCtr50vSW010kR_bcosLw&state=76001723519d8096510e8398945090d8f32228d5b67ec99f
end
