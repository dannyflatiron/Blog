Rails.application.routes.draw do

  # create custom route for signup page
  get '/signup' => 'users#new'
   


  # resources :categories
  resources :comments
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
