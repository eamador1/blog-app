Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [] do
      resources :posts, only: [:index]
    end
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
  end
end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'users#index'
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create, :destroy] do
        post 'like', to: 'likes#create', on: :member, as:
        :user_post_likes
        resources :comments, only: [:create, :new, :destroy]
        resources :likes, only: [:create]

  end 
  get 'posts', to: 'posts#index', on: :member, as:
  :user_posts
  end 
end
