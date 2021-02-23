Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :products do
    resources :trades, only: [:new, :create]
  end

  resources :trades, only: [:show, :edit, :update] 
end
