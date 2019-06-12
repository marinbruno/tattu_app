Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  get '/users/:id', to: 'profile#show', as: 'profile'

  resources :tattoos
  resources :artists
end
