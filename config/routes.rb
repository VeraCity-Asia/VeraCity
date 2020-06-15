Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  get 'aboutus', to: 'pages#aboutus'
  get 'welcome', to: 'pages#registration', as: :welcome
  get 'contact_us', to: 'pages#contact_us'
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
    resources :offers, only: [:index, :show, :update] do
      member do
        get 'generateoffer', to: 'offers#generateoffer'
      end
    end
    resources :products, only: [:create, :new, :edit, :update, :destroy]
    get 'dashboard', to: 'dashboard#index'
  end
  resources :suppliers, only: [:show, :edit, :update]
  namespace :purchasers do
    resources :offers, only: [:new, :show, :index, :create, :destroy]
    get 'dashboard', to: 'dashboard#index'
  end
end
