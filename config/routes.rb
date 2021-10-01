Rails.application.routes.draw do
  devise_for :users
  get 'books/index'
  get '/book/genre', to: "books#genre"
  root to: "books#index"
  resources :books do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :relationships, only: [:create, :destroy]
end