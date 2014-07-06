Rails.application.routes.draw do

  root :to => 'users#index'

  match 'mypics', to: 'images#mypics', via: [:get]

  resources :users, only: [:index, :new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :images, only: [:new, :create]
end



  # mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # match 'auth/:provider/callback', to: 'sessions#create', as: 'signin', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # match 'clips/next', to: 'clips#next', as: 'next_clip', via: [:get]
  # match 'votes/create', to: 'votes#create', as: 'create_vote', via: [:post]
  # match 'cc_apikey', to: 'application#apikey', as: 'cc_apikey', via: [:get]