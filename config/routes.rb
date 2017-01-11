Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root 'pages#show', page:'home'

  resources :lessons
  get '/lessons/publish/:id' => 'lessons#publish'
  resources :tweets
  resources :users
  resources :block_list, only: [:index, :update, :new, :create]

  get '/pages/:page' => 'pages#show'

  # get '/educatees/new' => 'educatees#new' - Try Tweechable page, removed per issue #41
  get '/educatees' => 'educatees#index'
  post '/educatees' => 'educatees#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
end
