Rails.application.routes.draw do
  get 'users/show'
  root 'home#index'
  get "home/about" => "home#about"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
