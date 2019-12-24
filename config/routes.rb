Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   get 'users/sign_in', to: 'admins/sessions#new', as: :new_admin_session
  #   get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  # end

  root to: "home#index"
  resources :pokemons, param: :slug
  
end
