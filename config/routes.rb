Rails.application.routes.draw do

  get 'home/index'
  root :to => "home#index"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'profile/:id', to: 'users#show', as: 'profile'

  resources :addresses, :amenities, :bookings, :desks, :profiles, :spaces, :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
