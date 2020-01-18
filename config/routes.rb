Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root to: 'rooms#show'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users
  resources :messages, only: [:create,:destroy]
  
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
