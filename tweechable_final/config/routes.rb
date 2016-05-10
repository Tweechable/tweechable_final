Rails.application.routes.draw do

  root 'pages#show', page:'home'

  resources :lessons
  get '/pages/:page' => 'pages#show'

  get '/twitters/new' => 'twitters#new'
  get '/twitters' => 'twitters#index'
  post '/twitters' => 'twitters#create'
  
end
