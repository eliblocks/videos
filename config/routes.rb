Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'users/index'

  get 'users/show'

  root 'videos#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'account', to: 'users#account'
  get 'search', to: 'videos#search'

  resources :users
  resources :charges
  resources :videos
  resources :plays
  resources :payments, only: [:new, :create]

end
