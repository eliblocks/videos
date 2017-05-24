Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root 'videos#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  get 'auth/vimeo/callback', to: 'sessions#vimeo'
  post '/videos/vimeo_selection', to: 'videos#vimeo_selection'

  resources :users
  resources :charges
  resources :videos
end
