Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  # get 'events/index'
  resources :events
  resources :users
  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
