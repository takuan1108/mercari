Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: 'registrations'}
  # devise_for :users, skip: :all
  devise_scope :user  do
    post 'registration' => 'devise/registrations#create', as: :create_registration
  end

  resources :users, only: [:index] do
    collection do
      get 'register_user_top'
      get 'register_user_address'
      get 'logout'
    end
  end
  resources :items
  get 'items/:id/buy' => 'items#buy'
  root 'items#index'
end
