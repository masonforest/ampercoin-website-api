Rails.application.routes.draw do
  resources :orders, only: [:show, :create]
end
