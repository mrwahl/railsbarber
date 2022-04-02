Rails.application.routes.draw do
  devise_for :users
  resources :appointments
  resources :barbers
  resources :customers
  resources :home

  #home page which contains the two external data feeds

  root to: "home#home"

  get 'search', to: "barbers#search"
  get 'search2', to: "customers#search"
  get 'search3', to: "appointments#search"
end
