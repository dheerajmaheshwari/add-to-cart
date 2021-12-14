Rails.application.routes.draw do
  root 'products#index'

  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  get 'products/index'
  get 'products/new'
  get 'products/edit'
  get 'cart_items/:id' => "cart_items#show", as: "cart_item"
  get 'carts/:id' => "carts#show", as: "cart"

  delete 'carts/:id' => "carts#destroy"
  delete 'cart_items/:id' => "cart_items#destroy"

  post 'cart_items' => "cart_items#create"
  post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"

  resources :products
  resources :orders
end
