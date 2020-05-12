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

  resources :comments
  resources :users do
    # /users/id/posts 
    resources :posts, only: [:new, :create, :index]
    resources :comments, only: [:index, :show]
  end

  
  resources :posts do
    resources :comments, only: [:new, :create, :index, :edit, :update]
  end

  # Google omniauth callback route
  get '/auth/:provider/callback' => 'sessions#google'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
