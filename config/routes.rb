Rails.application.routes.draw do
  get 'dashboard/index'
  root 'sessions#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'dashboard', to: 'dashboard#index'
  get '/normal_slip', to: 'slips#new', as: 'new_normal_slip'
  post '/normal_slip', to: 'slips#create', as: 'create_normal_slip'

  resources :users, only: [:new, :create]
  resources :deposit_requests, only: [:new, :create]

end
