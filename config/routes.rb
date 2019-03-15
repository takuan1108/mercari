Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  devise_scope :user  do
    post 'registration' => 'devise/registrations#create', as: :create_registration
  end

  resources :users, only: [:index, :show] do
    collection do
      resource :card, except: [:edit, :update], module: "users"
      get 'register_user_top'
      post 'register_user_tel'
      get 'register_user_address'
      get 'logout'
    end
  end
  resources :items do
    resource :deal, only: [:new, :create], module: "items" do
      resource :card, except: [:edit, :update], module: "deals"
    end
  end
  root 'items#index'
end
