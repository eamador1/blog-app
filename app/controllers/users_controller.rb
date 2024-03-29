class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(posts: [:comments]).find(params[:id])
    @post = @user.posts
  end
end
