Rails.application.routes.draw do

  resources :articles

  root 'articles#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
    get '/register', to: 'users#new'
    post '/register', to: 'users#create'
end
