Rails.application.routes.draw do

  root 'courses#index'

  get '/about', to: 'static#about'
  get '/eula', to: 'static#eula'
  get '/terms', to: 'static#terms'
  get '/paymentaddendum', to: 'static#paymentaddendum'
  get '/privacy', to: 'static#privacy'
  get '/contact', to: 'static#contact'
  get '/license_agreement', to: 'static#license_agreement'
  get 'getting_paid', to: 'static#getting_paid'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'account', to: 'users#account'
  get 'profile', to: 'users#show'
  get 'search', to: 'videos#search'
  get 'test_login', to: 'sessions#test_login'
  get 'videos', to: 'videos#index'
  get 'videos/new', to: 'videos#new', as: 'new_video'
  post 'videos', to: 'videos#create'

  get 'sessions/:id', to: 'sessions#impersonate'

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :users, :videos, :courses, :sections
    get 'sessions/:id', to: 'sessions#impersonate', as: "impersonate"
  end

  resources :users
  resources :charges

  resources :plays
  resources :payments, only: [:new, :create]
  resources :courses do
    resources :sections, shallow: true
    resources :videos, shallow: true
  end

end
