Rails.application.routes.draw do
  resources :orders, only: [:show, :create]
  post '/orders/:order_id/payments', to: 'payments#create'
end
