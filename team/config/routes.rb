Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	# root 'commands#index'

  get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"
	get "account/:id" => "users#edit", :as => "account"

  get 'sessions/new'
  root :to => "sessions#new"
	resources :sessions

	resources :commands do
		resources :users
	end

	resources :users

	resources :search

  end
