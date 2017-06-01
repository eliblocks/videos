Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root 'videos#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :users
  resources :checkouts
  resources :videos
  resources :plays
  resources :payments, only: [:new, :create]
end
