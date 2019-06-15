Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  get   '/profile',      to: "profile#show", as: :profile
  put   '/profile',      to: "profile#update"
  patch '/profile',      to: "profile#update"
  get   '/profile/edit', to: "profile#edit", as: :edit_profile

  get   '/profile/:profile_id/places',     to: "places#create",  as: 'user_places'
  post   '/profile/:profile_id/places',     to: "places#create"
  get   '/profile/:profile_id/places/new', to: "places#new"   ,  as: 'new_user_places'
  get   '/places/:id',                     to: "places#destroy", as: 'place'

  get   '/tattoos/:id/tags', to: "taggings#new", as: :tags
  put   '/tattoos/:id/tags', to: "taggings#update"
  patch '/tattoos/:id/tags', to: "taggings#update"

  resources :tattoos
  resources :artists

end
