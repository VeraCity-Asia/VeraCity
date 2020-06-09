Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products
  resources :suppliers, only: [:show]
  namespace :suppliers do
    resources :verifications, only: [:edit, :update]
    resources :certifications, only: [:new, :create, :edit, :update]
    resources :licenses, only: [:new, :create, :destroy]
    resources :offers, only: [:index, :show, :update]
  end
  namespace :purchasers do
    resources :offers, only: [:new, :show, :index, :create, :delete]
  end
end
