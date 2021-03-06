Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'courses#index'

  get '/about', to: 'static#about'
  get '/eula', to: 'static#eula'
  get '/terms', to: 'static#terms'
  get '/paymentaddendum', to: 'static#paymentaddendum'
  get '/privacy', to: 'static#privacy'
  get '/contact', to: 'static#contact'
  get '/license_agreement', to: 'static#license_agreement'
  get 'getting_paid', to: 'static#getting_paid'

  # get 'auth/facebook/callback', to: 'sessions#create'
  # get 'login', to: 'sessions#new'
  # get 'logout', to: 'sessions#destroy'
  get 'account', to: 'users#account'
  get 'profile', to: 'users#show'
  get 'search', to: 'videos#search'
  get 'test_login', to: 'sessions#test_login'
  get 'instructor_agreement', to: 'static#instructor_agreement'
  # get 'videos', to: 'videos#index'
  # get 'videos/new', to: 'videos#new', as: 'new_video'
  # post 'videos', to: 'videos#create'

  get 'sessions/:id', to: 'sessions#impersonate'


  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :users
    resources :courses, shallow: true do
      member do
        post 'toggle_approval'
      end
      resources :sections do
        resources :videos do
          member do
            post 'toggle_approval'
          end
        end
      end
    end
    get 'sessions/:id', to: 'sessions#impersonate', as: "impersonate"
    get 'videos', to: 'videos#index'
  end

  resources :users
  resources :charges

  resources :plays
  resources :payments, only: [:new, :create]
  resources :courses, shallow: true do
    resources :sections do
      resources :videos do
        member do
          get 'download'
        end
      end
    end
  end

end
