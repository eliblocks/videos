Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  root 'videos#index'

  get '/about', to: 'static#about'
  get '/eula', to: 'static#eula'
  get '/terms', to: 'static#terms'
  get '/paymentaddendum', to: 'static#paymentaddendum'
  get '/privacy', to: 'static#privacy'
  get '/contact', to: 'static#contact'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'account', to: 'users#account'
  get 'profile', to: 'users#show'
  get 'search', to: 'videos#search'
  get 'test_login', to: 'sessions#test_login'

  resources :users
  resources :charges
  resources :videos
  resources :plays
  resources :payments, only: [:new, :create]

end
