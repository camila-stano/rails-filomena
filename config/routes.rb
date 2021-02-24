Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  get '/user' => "products#index", :as => :user_root
  resources :profiles, only: [:show]

  resources :products do
    resources :trades, only: [ :new, :create]
  end

  resources :trades, only: [:index, :show, :edit, :update] 
end
