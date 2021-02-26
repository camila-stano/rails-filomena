Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :profiles, only: [:show]
  get '/user' => "products#index", :as => :user_root
  patch 'products/:id/arquive', to: 'products#arquive', as: :arquive_product
  patch 'products/:id/unarquive', to: 'products#unarquive', as: :unarquive_product
  get 'profiles/:id/arquive', to: 'profiles#arquived', as: :arquived_profile

  resources :products do
    resources :trades, only: [:new, :create]
  end

  resources :trades, only: [:index, :show, :edit, :update] 
end
