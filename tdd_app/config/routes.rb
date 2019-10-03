Rails.application.routes.draw do
  root 'welcomes#index'

  resources :customers
end
