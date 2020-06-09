Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products
  namespace :suppliers do
    resources :verifications, only: [:edit, :update]
    resources :certifications, only: [:new, :update, :edit, :update]
  end
end
