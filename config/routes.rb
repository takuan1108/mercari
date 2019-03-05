Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index] do
    collection do
      get 'logout'
      get 'add_card_info'
    end
  end
  resources :items
  get 'items/:id/buy' => 'items#buy'
  root 'items#index'
end
