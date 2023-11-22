Rails.application.routes.draw do
  get 'checkout/index'
  devise_for :users
  get 'products', to: 'products#index', as: 'products'
  get 'carts', to: 'carts#index', as: 'carts'
  get 'wishlists', to: 'wishlists#index', as: 'wishlists'
  post 'carts', to: 'carts#add_to_cart', as: 'add_to_cart'
  get '/checkout', to: 'checkout#index', as: 'checkout'
  patch 'update_quantity_cart/:id', to: 'carts#update_quantity', as: 'update_quantity_cart'
  get 'wishlists/:id/edit', to: 'wishlists#edit', as: 'edit_wishlist_item'
  post 'carts', to: 'carts#dd_to_cart'
  #get 'wishlists/:id/add_to_cart', to: 'wishlists#add_to_cart'
  delete 'carts/:id', to: 'carts#destroy'
  delete 'wishlists/:id', to: 'wishlists#destroy'
  get 'carts/:id/edit', to: 'carts#edit', as: 'edit_cart'
  patch 'wishlists/:id', to: 'wishlists#update'
  patch 'carts/:id', to: 'carts#update'
  patch 'carts/:id', to: 'carts#update'
  resources :carts
  resources :wishlists

  resources :carts, only: [:index, :show, :edit, :update, :destroy]


  resources :carts do
    member do
      delete 'destroy'
    end
  end
  # config/routes.rb

  resources :wishlists, only: [:index, :show, :edit, :update, :destroy]
  resources :wishlists do
    post 'add_to_cart', on: :member
  end
  resources :carts, only: [:edit, :update]

  resources :wishlists do
    member do

      delete :remove_from_wishlist
      put :update_quantity

    end
  end

  resources :products do
    resources :wishlist_item
  end
  resources :wishlists do
    member do
      post 'add_to_cart'
    end
  end
  resources :carts do
    patch 'update_quantity', on: :member
  end
  resources :carts do
    member do
      delete 'remove_from_cart'
    end
  end
  resources :carts do
    patch :update_quantity, on: :member
  end
  # config/routes.rb

resources :carts do
  patch :update, on: :member
end


  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
  get 'home', to: 'pages#home', as: 'home'


  root to: 'products#index'

end
