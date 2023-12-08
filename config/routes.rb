Rails.application.routes.draw do
  get 'returns/new'
  get 'returns/create'
  get 'personal_information', to: 'personal_information#show', as: 'personal_information'
  devise_for :users, controllers: { registrations: 'registrations' }
  #define about page ----HITHAM
  #get '/about', to: 'pages#about', as: 'about'
  #get '/contact', to: 'pages#contact', as: 'contact'
# get cat
  root 'store#cat'
  get 'store/cat', to: 'store#cat', as: 'home'
#  get 'personal_information/show'
delete '/users/:id', to: 'users#destroy', as: 'delete_user'
get 'account_deletion/confirm', to: 'account_deletion#confirm', as: 'confirm_account_deletion'
delete 'confirm_account_deletion', to: 'personal_information#destroy', as: 'delete_personal_information'




  get 'items', to: 'items#index', as: 'items'
  get 'items/:id', to: 'items#show', as: 'item'
  get 'checkout/index'
  #devise_for :users

  # STO-7
  get 'products', to: 'products#index', as: 'products'
  post 'products', to: 'products#create'
  get 'product/new', to: 'products#new', as: 'product_new'
  get "product/:id", to: 'products#show', as: 'product'
  get "product/:id/edit", to: 'products#edit', as: 'product_edit'
  patch 'product/:id', to: 'products#update'
  delete 'product/:id', to: 'products#destroy'
  # end of STO-7

  # STO-6
  get 'orders/', to: 'orders#index', as: 'orders'
  post 'orders/:id', to: 'orders#create'
  get 'orders/:id', to: 'orders#show', as: 'order'

  post 'orders', to: 'orders#create_from_cart', as: 'create_from_carts'
  # end of STO-6

  # STO-Review
  post 'items/:product_id/reviews', to: 'reviews#create', as: 'reviews'
  get 'items/:product_id/reviews/new', to: 'reviews#new', as: 'review_new'
  get 'items/:product_id/reviews/:id/edit', to: 'reviews#edit', as: 'review_edit'
  patch 'items/:product_id/reviews/:id', to: 'reviews#update', as: 'review'
  delete 'items/:product_id/reviews/:id', to: 'reviews#destroy', as: 'review_destroy'

  #get 'products', to: 'products#index', as: 'products'
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
 # patch 'carts/:id', to: 'carts#update'
  resources :carts
  resources :wishlists

  resources :carts, only: [:index, :show, :edit, :update, :destroy]

  # STO-Review
  # resources :products do
    # resources :reviews, only: [:new, :create]
  # end

  resources :carts do
    member do
      delete 'destroy'
    end
  end

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
  resources :carts do
    post 'checkout_from_cart', on: :member
  end
  # config/routes.rb

resources :carts do
  patch :update, on: :member
end
resources :orders do
  post 'checkout_from_carts', on: :collection
end
# config/routes.rb

resources :orders, only: [:new, :create, :show]
resources :products, only: [:show]

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:show]
# config/routes.rb


  resources :orders do
    resource :return, only: [:new, :create]
  end
end
