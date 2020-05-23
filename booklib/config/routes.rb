Rails.application.routes.draw do
  resources :choices
  resources :books
  resources :users

  root 'books#show'

  get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"
	get "account/:id" => "users#show", :as => "account"

  get "get_current_user" => "books#get_current_user", :as => "get_current_user"
  get "get_choice" => "books#get_choice", :as => "get_choice"

  get "get_choice_by_user" => "users#get_choice_by_user", :as => "get_choice_by_user"
  get "get_book_by_user" => "users#get_book_by_user", :as => "get_book_by_user"


  get 'sessions/new'
#  root :to => "sessions#new"
	resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
