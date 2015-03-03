Studout::Application.routes.draw do
  resources :high_schools

  resources :categories

  resources :pictures, only: [:create, :destroy]
  resources :countries, only: [:index, :edit, :create, :update, :destroy]
  resources :cities, only: [:index, :edit, :create, :update, :destroy]
  resources :places
  devise_for :users
  root 'places#index'
end
