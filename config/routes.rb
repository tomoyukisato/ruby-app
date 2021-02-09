Rails.application.routes.draw do
  namespace :api do
    get 'categories/show'
  end
  namespace :api do
    get 'genres/show'
  end
  get 'categories/index'
  get 'categories/edit'
  # devise_for :users
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  namespace :api do 
    resources :categories, only: %i(show)
  end
  namespace :api do 
    resources :products, only: [:show]
  end
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  resources :products, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
    resources :comments, only: [:create]
  end
  root 'products#index'
  
  resources :categories, except: [:new, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
