Rails.application.routes.draw do
  namespace :admin do
    resources :charges
    resources :customers
    resources :payments
    resources :plays
    resources :sources
    resources :users
    resources :videos

    root to: "charges#index"
  end

  get 'users/index'

  get 'users/show'

  root 'videos#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :users
  resources :charges
  resources :videos
  resources :plays
  resources :payments, only: [:new, :create]
end
