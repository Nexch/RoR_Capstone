# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :users, only: %i[index show]
  resources :follows, only: %i[new create index]
  resources :tweets do
    member do
      put 'like', to: 'tweets#like'
      put 'dislike', to: 'tweets#dislike'
    end
  end
end
