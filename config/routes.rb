Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :lists, only: [:index, :show, :new, :create]
  resources :lists do
    resources :comments
  end
  devise_for :users
  resources :users
  resources :nodes, only: [:show, :index, :create, :new] 

  root 'lists#index'

  get 'search', to: 'search#search'

  get ':name', to: 'profiles#show', as: :profile 
  get ':name/edit', to: 'profiles#edit', as: :edit_profile 
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile




end






















