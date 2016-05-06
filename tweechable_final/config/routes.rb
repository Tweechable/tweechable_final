Rails.application.routes.draw do

  root 'pages#show', page:'home'

  resources :lessons
  get '/pages/:page' => 'pages#show'
  
end
