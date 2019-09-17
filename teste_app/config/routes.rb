Rails.application.routes.draw do
  devise_for :members
  root 'customers#index'
  resources :customers
end
