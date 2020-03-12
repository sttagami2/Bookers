Rails.application.routes.draw do
  devise_for :users

  root 'users#index'

  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:index, :show]
end
