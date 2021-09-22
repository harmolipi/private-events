Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :events
  resources :users
  resources :rsvps
  # resources :invitations
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
