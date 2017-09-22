Rails.application.routes.draw do

  resources :images
  get 'welcome/index'

  root 'welcome#index'
  
  resources :articles do 
    resources :comments 
  end 
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
    get '/register', to: 'users#new'
    post '/register', to: 'users#create'

  resources :photos
end
