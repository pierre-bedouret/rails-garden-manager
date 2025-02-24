Rails.application.routes.draw do
  root to: 'gardens#index'

  resources :gardens, only: [:index, :show, :create] do
    resources :plants, only: [:create, :update]
  end
  resources :plants, only: [:index, :show, :destroy]
end
