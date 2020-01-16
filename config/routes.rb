Rails.application.routes.draw do
  root 'posts#index'

  # User routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/account', to: 'users#edit'
  patch '/account', to: 'users#update'
  delete 'account', to: 'users#destroy'

  # Session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Post routes
  resources :posts, only: [:new, :create, :destroy]
end
