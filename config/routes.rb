Rails.application.routes.draw do
  resources :orders, only: [:show, :create]
  resources :preordered_accounts, only:[:show, :create, :index]
  post '/orders/:order_id/payments', to: 'payments#create'
end
