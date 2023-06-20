Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update, :destroy]
  resources :watchlists, only: [:show, :create, :update, :destroy]
  resources :releases, only: [:index, :show]
  resources :favorites, only: [:create, :index, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
