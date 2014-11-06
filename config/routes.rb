Rails.application.routes.draw do
  
  resources :users, :only => [:show] do
    resources :groups, :only => [:index, :show]
  end
  # Prefix        Verb  URI                          Controller#Action
  # user_groups   GET   /users/:user_id/groups       groups#index
  # user_group    GET   /users/:user_id/groups/:id   groups#show
  # user          GET   /users/:id                   users#show


  root 'sessions#new'
  # Prefix        Verb  URI    Controller#Action
  # root          GET   /      sessions#new


  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Prefix                  Verb  URI                               Controller#Action
  # login                   GET  /login(.:format)                   sessions#new
  # sessions                POST /sessions(.:format)                sessions#create
  # logout                  GET  /logout(.:format)                  sessions#destroy
  # auth_spotify_callback   GET  /auth/spotify/callback(.:format)   users#spotify

  
  get '/auth/spotify/callback', to: 'users#spotify'
  # data that Spotify returns to us

end
