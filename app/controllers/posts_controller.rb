class PostsController < ApplicationController
  def index
    @user = User.find(params([:user_id]))
    @post = @user.posts
  end

  def show
    @post = Post.find(params[:user_id])
    @comments = @post.comments
  end
end
