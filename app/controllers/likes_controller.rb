class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(likes_params)
    if @like.save
      flash[:notice] = 'Like added!'
    else
      flash[:notice] = @like.errors.full_messages.to_sentence unless @like.save
    end
    redirect_to user_post_path(@like.post.author, @like.post)
  end

  private

  def likes_params
    params.require(:like).permit(:post_id)
  end
end
