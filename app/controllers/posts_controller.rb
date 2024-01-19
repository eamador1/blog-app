class PostsController < ApplicationController
  
  load_and_authorize_resource

  before_action :set_user, only: %i[index show new create]
  before_action :set_post, only: [:show]
  before_action :inspect_user_and_ability


  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:user, :comments, :likes).order(created_at: :desc)
  end

  def new
    @post = @user.posts.build
  end

  def create
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(@user, @post), notice: 'Post was succesfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @user = current_user
    @post = Post.includes(:author, :comments).find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @post.update_posts_counter
    redirect_to user_posts_path(@post.author_id), notice: 'Post deleted successfully'
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  private

  def inspect_user_and_ability
    Rails.logger.debug("Current User: #{current_user.inspect}")
    Rails.logger.debug("Ability: #{current_ability.inspect}")
  end
end
