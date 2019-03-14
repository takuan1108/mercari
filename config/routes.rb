Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: 'registrations'}
  # devise_for :users, skip: :all
  devise_scope :user  do
    post 'registration' => 'devise/registrations#create', as: :create_registration
  end

  resources :users, only: [:index] do
    collection do
      resource :card
      get 'register_user_top'
      post 'register_user_tel'
      get 'register_user_address'
      get 'logout'
    end
  end
  resources :items do
    member do
      get 'buy'
      post 'pay'
    end
  end
  root 'items#index'
end
