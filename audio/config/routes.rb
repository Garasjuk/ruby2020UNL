Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'group#index'

  resources :group do
    resources :artists
  end
  resources :group do
    resources :alboms
  end
  resources :artists do
    resources :alboms
  end
  resources :alboms do
    resources :songs
  end
  resources :geners do
    resources :alboms
  end
end
