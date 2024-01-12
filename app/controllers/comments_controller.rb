class CommentsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post),
                  notice: 'Comment added!'
    else
      puts "Validation errors: #{comment.errors.full_messages}" # Add this line for debugging
      flash.now[:alert] = 'Comment not added!'
      render 'posts/show'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
