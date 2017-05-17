Rails.application.routes.draw do
  root 'videos#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :charges

end
