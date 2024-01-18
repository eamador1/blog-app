Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'users#index'
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create, :destroy] do
        post 'like', to: 'likes#create', on: :member, as:
        :user_post_likes
        resources :comments, only: [:create, :destroy]
        resources :likes, only: [:create]

  end 
  get 'posts', to: 'posts#index', on: :member, as:
  :user_posts
  end 
end
