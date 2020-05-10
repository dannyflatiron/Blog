Rails.application.routes.draw do

  root "sessions#home"
  # create custom route for signup page
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'


  #logout routes
  delete '/logout' => 'sessions#destroy'

  # resources :categories
  resources :comments
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
