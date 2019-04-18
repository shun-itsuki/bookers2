Rails.application.routes.draw do

  root "books#home"
  get "books/about" => "books#about"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users


end
