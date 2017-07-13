Rails.application.routes.draw do
  resources :blogs
  resources :profile, only: [:show]

  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

  get 'blogs/user/:user_id', to: 'blogs#index', as: 'user_blogs'

  root to: "blogs#index"
end
