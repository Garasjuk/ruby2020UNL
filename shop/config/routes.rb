Rails.application.routes.draw do
  devise_for :users
  resources :product_orders
  resources :orders

  resources :orders do
    resources :product_orders
  end

  resources :users
  resources :users do
    resources :orders
  end

  resources :products
  resources :products do
    resources :product_orders
  end

  root 'products#index'

  get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"
	get "account/:id" => "users#edit", :as => "account"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
