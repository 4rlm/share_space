Rails.application.routes.draw do
  resources :users
  resources :spaces
  resources :profiles
  resources :desks
  resources :bookings
  resources :amenities
  resources :addresses
  get 'home/index'
  root :to => "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
