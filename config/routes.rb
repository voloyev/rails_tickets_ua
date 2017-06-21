Rails.application.routes.draw do
  devise_for :users

  resources :conversaions do
    resources :messages
  end
end
