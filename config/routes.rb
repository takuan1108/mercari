Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index] do
    collection do
      get 'logout'
    end
  end
  resources :items

  root 'items#index'
<<<<<<< HEAD

=======
>>>>>>> ma-kun92/master
end
