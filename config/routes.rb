Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products
  resources :messages, only: [:index, :new, :create]
  resources :suppliers, only: [:show]
  namespace :suppliers do
    resources :verifications, only: [:edit, :update]
    resources :certifications, only: [:new, :create, :edit, :update]
    resources :licenses, only: [:new, :create, :destroy]
    resources :offers, only: [:index, :show, :update]
    resources :dashboards, only: [:index]
  end
  namespace :purchasers do
    resources :offers, only: [:new, :show, :index, :create, :delete]
    resources :dashboards, only: [:index]
  end
end
