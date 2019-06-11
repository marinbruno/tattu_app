Rails.application.routes.draw do
  root to: 'tattoos#index'
  devise_for :users

  resources :tattoos, except: [:index]
end
