LostAndFound::Application.routes.draw do
  resources :items
  resources :users
  resources :sessions

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => "items#index"
end
