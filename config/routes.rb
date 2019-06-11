Rails.application.routes.draw do
  root to: 'tattoos#index'
  devise_for :users

  get '/users/:id', to: 'profile#show', as: 'profile'

  resources :tattoos, except: [:index]
  resources :artists
end
