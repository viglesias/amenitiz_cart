Rails.application.routes.draw do
  resources :products, only: [:index]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add'
    put 'remove/:product_id', to: 'carts#remove'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
