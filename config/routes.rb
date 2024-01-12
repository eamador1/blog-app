Rails.application.routes.draw do
  root 'users#index'
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create] do
        post 'like', to: 'likes#create', on: :member, as:
        :user_post_likes
        resources :comments, only: [:create, :new]
        resources :likes, only: [:create]

  end 
  get 'posts', to: 'posts#index', on: :member, as:
  :user_posts
  end 
end
