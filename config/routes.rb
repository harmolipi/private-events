Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :events
  resources :users
  resources :rsvps
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
