Rails.application.routes.draw do
  resources :notifications
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'articles#index'
  get 'articles/index'
  get "show_article" => "articles#show_article", :as => "show_article"
  resources :articles

  mount ActionCable.server => '/cable'
end
