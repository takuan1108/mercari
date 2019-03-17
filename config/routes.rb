Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user  do
    post 'registration' => 'devise/registrations#create', as: :create_registration
  end

  resources :users, only: [:index, :edit, :update] do
    collection do
      resource :card
      resource :street_addresses
      resource :vendor
      post 'update_profile'
      get 'register_user_top'
      post 'register_user_tel'
      get 'register_user_address'
      post 'register_user_card'
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
