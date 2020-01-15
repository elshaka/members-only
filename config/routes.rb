Rails.application.routes.draw do
  root 'static_pages#home'

  # User routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, except: [:new, :create]

  # Session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
