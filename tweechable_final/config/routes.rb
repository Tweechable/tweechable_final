Rails.application.routes.draw do

  root 'pages#show', page:'home'

  resources :lessons
  resources :tweets
  resources :users

  get '/pages/:page' => 'pages#show'

  get '/twitters/new' => 'twitters#new'
  get '/twitters' => 'twitters#index'
  post '/twitters' => 'twitters#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
end
