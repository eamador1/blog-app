class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includesf(posts: [:comments]).find(params[:id])
    @post = @user.posts
  end
end
