Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments
  end
  resources :profiles
  resources :categories, only: [:show]

  root "posts#index"

  get '/search', to: "posts#search"

end
