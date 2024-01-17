require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'post index page' do
    before do
      @user = User.create(name: 'FirstUser')
      @post1 = Post.create(title: 'Hello 1', text: 'I am so glad to say hello 1 Lorem ipsum dolor sit amet,',
                           author_id: @user.id)
      @comment1 = Comment.create(user: @user, post_id: @post1.id, text: 'I like this post')
      @comment2 = Comment.create(user: @user, post_id: @post1.id, text: 'I like this post 2')
      @comment3 = Comment.create(user: @user, post_id: @post1.id, text: 'I like this post 3')
      @comment4 = Comment.create(user: @user, post_id: @post1.id, text: 'I like this post 4')
      @comment5 = Comment.create(user: @user, post_id: @post1.id, text: 'I like this post 5')
      @comment6 = Comment.create(user: @user, post_id: @post1.id, text: 'I like this post 6')
      Like.create(user_id: @user.id, post_id: @post1.id)
      visit user_post_path(@user.id, @post1.id)
    end

    it 'displays posts title' do
      expect(page).to have_content('Hello 1')
    end

    it 'displays who wrote the post' do
      expect(page).to have_content('FirstUser')
    end

    it 'displays how many comments the post has' do
      expect(page).to have_content('Comments 6')
    end

    it 'displays how many comments the post has' do
      expect(page).to have_content('Likes 1')
    end

    it 'displays the post body' do
      expect(page).to have_content(@post1.text)
    end

    it 'displays the username of each commentator' do
      [@comment1, @comment2, @comment3, @comment4, @comment5, @comment6].each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end

    it 'displays the comment each commentator left' do
      expect(page).to have_content('I like this post')
      # expect(page).to have_content('I like this post 2')
      # expect(page).to have_content('I like this post 3')
      # expect(page).to have_content('I like this post 4')
      # expect(page).to have_content('I like this post 5')
      # expect(page).to have_content('I like this post 6')
    end
  end
end
