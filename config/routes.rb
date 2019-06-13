Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  get   '/profile',      to: "profile#show", as: :profile
  put   '/profile',      to: "profile#update"
  patch '/profile',      to: "profile#update"
  get   '/profile/edit', to: "profile#edit", as: :edit_profile

  resources :tattoos
  resources :artists
end
