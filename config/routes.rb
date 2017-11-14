Rails.application.routes.draw do

  resources :space_amenities
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'profile/:id', to: 'users#show', as: 'tomato'

  get 'home/index'
  root :to => "home#index"


  # root to: 'photos#index'
  # resources :photos, only: [:new, :create, :index, :destroy]

  resources :spaces do
    collection { post :search, to: 'spaces#index' }
  end

  resources :addresses, :amenities, :bookings, :desks, :photos, :profiles, :sessions, :spaces, :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
