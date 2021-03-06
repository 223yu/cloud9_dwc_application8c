Rails.application.routes.draw do
  get 'group_users/create'
  get 'group_users/destroy'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search' => 'searches#search'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :books,only: [:show, :index, :edit, :create, :update]do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :groups, only: [:show, :index, :new, :create, :edit, :update]
  resources :group_users, only: [:create, :destroy]
end