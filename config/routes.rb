Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index] do
    collection do
      get 'logout'
    end
  end
  resources :items
  get 'items/:id/buy' => 'items#buy'
  root 'items#index'
end
