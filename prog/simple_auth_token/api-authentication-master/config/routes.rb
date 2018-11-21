Rails.application.routes.draw do
  resources :users, only: [:show]
  devise_for :users
  resources :sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
