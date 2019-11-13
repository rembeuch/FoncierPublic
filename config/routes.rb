Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats, only: [:index, :show] do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index]

  namespace :owner do
    resources :flats, only: [:index, :new, :create]
    resources :reservations, only: [:index] do
      member do
        patch 'accept'
        patch 'decline'
      end
    end
  end
end
