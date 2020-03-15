Rails.application.routes.draw do
  devise_for :users

  root 'books#new'

  resources :users, only: [:index, :show, :edit, :new] 
  resources :books, only: [:create, :index, :show, :new]
end
