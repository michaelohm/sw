Rails.application.routes.draw do

  root :to => 'users#index'

  resources :users, only: [:index, :new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :images, only: [:new, :create]
end
