Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  # devise_for :users, skip: :all
  devise_scope :user  do
    post 'registration' => 'devise/registrations#create', as: :create_registration
  end

  resources :users, only: [:index] do
    collection do
      post 'register_user_tel'
      get 'register_user_address'
      post 'register_user_card'
      post 'register_user_complete'
      get 'logout'
      get 'add_card_info'
      get 'add_card'
      post 'pay'
      delete 'delete_card'
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
