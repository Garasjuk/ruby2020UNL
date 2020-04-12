Rails.application.routes.draw do

root to: 'users#index'

get 'friend', to: 'users#friend', as: 'friend'
get 'neutrality', to: 'users#neutrality', as: 'neutrality'
get 'enemy', to: 'users#enemy', as: 'enemy'

resources :users
resources :enemys, controller: :users
resources :friends
resources :neutrality


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
