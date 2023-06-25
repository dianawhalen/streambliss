Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update, :destroy] do
    resource :watchlist, only: [:show, :update]
    resources :favorites, only: [:index, :update]
  end

  resources :releases, only: [:index, :show] do
    resources :sources, only: [:index]
  end

  resources :sources, only: [:index] do
    resources :releases, only: [:index]
  end

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
