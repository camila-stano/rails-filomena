Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :profiles, only: [:show]

  resources :products do
    resources :trades, only: [:new, :create]
  end

  resources :trades, only: [:show, :edit, :update] 
end
