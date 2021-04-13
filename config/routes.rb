Rails.application.routes.draw do
  resources :bulk_orders
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
