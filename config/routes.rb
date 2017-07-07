Rails.application.routes.draw do
  resources :blogs

  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

  root to: "blogs#index"
end
