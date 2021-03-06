Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :bookings, only: [:create, :new, :edit, :update]
    resources :reviews, only: [:create, :new]
  end
  resources :bookings, only: [:show, :index, :destroy]
  resources :reviews, only: [:destroy]
end
