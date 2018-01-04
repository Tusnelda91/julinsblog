Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  get 'pages/about'

  get 'pages/contact'

  get 'posts/index'

  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts

resources :posts do
	resources :comments
end

resources :users
end
