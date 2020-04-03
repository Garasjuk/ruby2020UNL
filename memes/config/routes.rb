Rails.application.routes.draw do

  root 'memes#index'
  #get 'about' => 'memes#about'
  resources :memes do
    resources :photos
  end

  resources :photos do
    resources :votings
  end

  get "meme_out" => "sessions#destroy", :as => "meme_out"
  get "new_meme_in" => "sessions#create", :as => "new_meme_in"
  resources :sessions

end
