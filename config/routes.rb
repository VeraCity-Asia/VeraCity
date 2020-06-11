Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'aboutus', to: 'pages#aboutus'
  get 'registration', to: 'pages#registration'
  resources :products, only: [:index, :show]
  resources :messages, only: [:index, :new, :create] do
    collection do
      get 'by_product'
    end
  end
  namespace :suppliers do
    resources :verifications, only: [:edit, :update]
    resources :certifications, only: [:new, :create, :edit, :update]
    resources :licenses, only: [:new, :create, :destroy]
    resources :offers, only: [:index, :show] do
      member do
        put 'approved', to: 'offers#approved'
        put 'rejected', to: 'offers#rejected'
        get 'generateoffer', to: 'offers#generateoffer'
      end
    end
    resources :products, only: [:create, :new, :edit, :update, :destroy]
    get 'dashboard', to: 'dashboard#index'
  end
  resources :suppliers, only: [:show]
  namespace :purchasers do
    resources :offers, only: [:new, :show, :index, :create, :destroy]
    get 'dashboard', to: 'dashboard#index'
  end
end
