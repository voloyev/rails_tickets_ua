Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'conversations#index'

  resources :conversations do
    resources :messages
  end
end
