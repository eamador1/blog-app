require 'rails_helper'

RSpec.describe Post, type: :feature do
  describe 'post index page' do
    before do
      @user = User.create(name: 'FirstUser', post_counter: 4, photo: 'https://picsum.photos/100', bio: 'Swiftie')
      @post1 = Post.create(title: 'Hello 1', text: 'I am so glad to say hello 1', author_id: @user.id)
      @post2 = Post.create(title: 'Hello 2', text: 'I am so glad to say hello 2', author_id: @user.id)
      @post3 = Post.create(title: 'Hello 3', text: 'I am so glad to say hello 3', author_id: @user.id)
      @post4 = Post.create(title: 'Hello 4', text: 'I am so glad to say hello 4, Lorem ipsum dolor sit amet,',
                           author_id: @user.id)
      @comment1 = Comment.create(user_id: @user.id, post_id: @post1.id, text: 'I like this post')
      visit user_posts_path(@user)
    end

    it 'displays profile picture for user' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it 'displays user username' do
      expect(page).to have_content('FirstUser')
    end

    it 'displays the users number of post' do
      expect(page).to have_content(@user.post_counter)
    end

    it 'displays a post title' do
      expect(page).to have_content(@post1.title)
    end

    it 'displays partially posts body' do
      expect(page).to have_content(@post1.text[0..10])
    end

    it 'displays first comment on a post' do
      expect(page).to have_content(@comment1.text)
    end

    it 'display how many comments a post has' do
      expect(page).to have_content('Comments 1')
      expect(page).to have_content('Comments 0')
    end

    it 'display how many comments a post has' do
      expect(page).to have_content('Likes 0')
    end

    it 'displays a "Pagination" button' do
      expect(page).to have_content('Pagination')
    end

    it 'redirects me to posts show page when click on a post' do
      click_link 'Hello 1'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
end
