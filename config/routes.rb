Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root 'videos#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  get 'auth/vimeo/callback', to: 'sessions#vimeo'
  get 'users/manage_videos', to: 'users#manage_videos', as: 'manage_videos'
  post 'videos/update_status'

  resources :users
  resources :charges
  resources :videos
end
