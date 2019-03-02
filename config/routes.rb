Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  resources :users, only: [:index]
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  resources :users, only: [:index] do
    collection do
      get 'test'
      get 'logout'
    end
  end
  resources :items

  root 'items#index'
>>>>>>> ma-kun92/master
end
