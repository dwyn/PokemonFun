Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  resources :pokemons, param: :slug
  
end
