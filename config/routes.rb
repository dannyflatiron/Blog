Rails.application.routes.draw do

  root "sessions#home"
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :comments
  resources :users do
    resources :posts, only: [:new, :create, :index]
    resources :comments, only: [:index, :show]
  end

  resources :posts do
    resources :comments, only: [:new, :create, :index, :edit, :update]
  end

  get '/auth/:provider/callback' => 'sessions#google'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
