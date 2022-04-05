Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :update]
  resources :games, only: [:index, :new, :create, :show, :update, :destroy]
  resources :bookings, only: [:create, :destroy]
  resources :locations, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
