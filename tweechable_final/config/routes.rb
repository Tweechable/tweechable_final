Rails.application.routes.draw do

  root 'lessons#index'

  resources :lessons
  
end
