Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "search", to: "books#search"
  get "create", to: "books#create"
  delete "books/:id", to: "books#destroy"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "/users/:id", to: "users#wishes"
   
  get "signup", to: "users#new"
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :wishes
    end 
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :wishes, only: [:create, :destroy]
end
