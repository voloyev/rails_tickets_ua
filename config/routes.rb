Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'conversations#index'

  resources :conversations do
    member do
      post :reply
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :mark_as_read
    end
  end

  resources :messages
end
