Rails.application.routes.draw do
  
  resources :users, :only => [:show] do
    resources :groups, :only => [:index, :show]
  end
  # Prefix        Verb  URI                          Controller#Action
  # user_groups   GET   /users/:user_id/groups       groups#index
  # user_group    GET   /users/:user_id/groups/:id   groups#show
  # user          GET   /users/:id                   users#show



  get '/login' => 'sessions#new'
  get '/auth/spotify/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  root 'users#show'
end
