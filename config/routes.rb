# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
  get 'home', to: 'pages#home', as: 'home'
  delete 'sign_out', to: 'pages#sign_out', as: 'sign_out'
end
