Rails.application.routes.draw do
  resources :blogs

  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

  get 'users/:id', to: "profiles#show", as: 'users'
  get 'blogs/user/:user_id', to: 'blogs#index', as: 'user_blogs'

  root to: "blogs#index"
end
