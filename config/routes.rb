# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :users, only: %i[show]
  resources :follows, only: %i[new create destroy index]
  resources :tweets, only: %i{index show} do
    member do
      put 'like', to: 'tweets#like'
      put 'dislike', to: 'tweets#dislike'
    end
  end
end
