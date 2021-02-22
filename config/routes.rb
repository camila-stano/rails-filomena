Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :clothes do
    resources :trades, except: :destroy do
      get 'reviews', to: 'trades#reviews_new', as: :reviews_new
      post 'reviews', to: 'trades#reviews_create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
