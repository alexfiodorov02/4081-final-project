Rails.application.routes.draw do
  devise_for :users

  # Redirect the root path to "/posts"
  root to: redirect('/posts')

  resources :posts do
    # Routes for managing forks of posts
    resources :forks, only: [:new, :create, :show]

    # Custom collection route for searching within posts
    collection do
      get 'search'
    end

    # Nested resources for comments, likes, flags, favorites
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :flags, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]

  end

  resources :forks do
    # Nested resources for comments, likes, flags, favorites
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :flags, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
  end

  resources :favorites, only: [:create, :destroy]

  resources :users, only: [:show] do
    resource :profile, only: [:show, :edit, :update]
    resources :follows, only: [:create, :destroy]
    get 'cookbook', to: 'profiles#cookbook', as: 'cookbook'
    resource :business, only: [:show, :new, :create, :edit, :update, :destroy]

  end
end

