Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index] do
    collection do
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
