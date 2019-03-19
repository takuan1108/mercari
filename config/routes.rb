Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user  do
    post 'registration' => 'devise/registrations#create', as: :create_registration
  end

  resources :users, only: [:index, :edit, :update] do
    collection do
      resource :card, except: [:edit, :update], module: "users"
      resource :street_addresses, only: [ :new, :create, :edit, :update]
      resource :vendor, only: [ :new, :create, :edit, :update]
      get 'register_user_top'
      get 'logout'
    end
  end
  resources :items do
    resource :deal, only: [:new, :create], module: "items" do
      resource :card, except: [:edit, :update], module: "deals"
      collection do
        get 'done'
      end
    end
  end
  root 'items#index'
end
