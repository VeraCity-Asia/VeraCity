Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products
  namespace :suppliers do
    resources :verifications, only: [:edit, :update]
    resources :certifications, only: [:new, :create, :edit, :update]
    resources :licenses, only: [:new, :create, :destroy]
  end
end
