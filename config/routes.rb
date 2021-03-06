Rails.application.routes.draw do
  devise_for :users

  get 'books/index'
  root to: "books#index"
  resources :books do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
    collection do
      get 'genre'
    end
  end
  resources :comments, only: [:destroy]
  resources :users, only: [:show, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end