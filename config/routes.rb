Rails.application.routes.draw do

  devise_for :users
  resources :users
  
  resources :items do
    resources :buyers, only: [:index, :create]
      collection do
        get 'search'
      end
  end
    root to: 'items#index'
end
