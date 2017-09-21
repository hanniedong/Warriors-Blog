Rails.application.routes.draw do

  get 'welcome/index'

  root 'welcome#index'
  
  resources :articles
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
    get '/register', to: 'users#new'
    post '/register', to: 'users#create'

  resources :photos
end
