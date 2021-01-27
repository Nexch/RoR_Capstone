Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "tweets#index"
  resources :users, only: [:index, :show]
  resources :follows, only: [:new, :create, :update, :destroy, :index]
end
