Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :new, :show] do
  end
end
