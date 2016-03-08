Rails.application.routes.draw do

  get 'search/index'

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :destroy], defaults: { format: 'json' }
    end
  end

  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  resources :search,  only: [:index]

end
