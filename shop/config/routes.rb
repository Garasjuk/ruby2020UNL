Rails.application.routes.draw do
  resources :product_orders
  resources :orders
  resources :users
  resources :products

  root 'products#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
