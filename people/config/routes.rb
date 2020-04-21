Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
#root to: 'users#new'

get 'friend', to: 'users#friend', as: 'friend'
get 'neutrality', to: 'users#neutrality', as: 'neutrality'
get 'enemy', to: 'users#enemy', as: 'enemy'


  get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"
	get "account/:id" => "users#edit", :as => "account"

  get 'sessions/new'
  root :to => "sessions#new"
	resources :sessions

#get 'persons/profile', as: 'user_root'

resources :users
resources :enemys, controller: :users
resources :friends
resources :neutrality

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
