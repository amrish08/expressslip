Rails.application.routes.draw do
  get 'profile/index'
  get 'dashboard/index'
  root 'sessions#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'dashboard', to: 'dashboard#index'
  get '/normal_slip', to: 'slips#new', as: 'new_normal_slip'
  post '/normal_slip', to: 'slips#create', as: 'create_normal_slip'
  get '/profile', to: 'profile#index', as: 'show_profile'
  get '/change_password', to: 'profile#change_password', as: 'change_password'
  post '/post_password', to: 'profile#post_password', as: 'post_password'

  resources :users, only: [:new, :create]
  resources :deposit_requests, only: [:new, :create, :index]
  resources :slip_payments, only: [:new, :create]
  resources :transactions, only: [:index]
  get "medical_centers", to: "medical_centers#index", as: :medical_centers
end
