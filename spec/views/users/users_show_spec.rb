require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'user show page' do
    before do
      @user = User.create(name: 'FirstUser', post_counter: 4, photo: 'https://picsum.photos/100', bio: 'Swiftie')
      @post1 = Post.create(title: 'Hello 1', text: 'I am so glad to say hello 1', author_id: @user.id)
      @post2 = Post.create(title: 'Hello 2', text: 'I am so glad to say hello 2', author_id: @user.id)
      @post3 = Post.create(title: 'Hello 3', text: 'I am so glad to say hello 3', author_id: @user.id)
      @post4 = Post.create(title: 'Hello 4', text: 'I am so glad to say hello 4', author_id: @user.id)

      visit user_path(@user)
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

    it 'displays the users bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'displays only users first three posts' do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
      expect(page).not_to have_content(@post4.title)
      expect(page).to have_content(@post1.text)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content(@post3.text)
      expect(page).not_to have_content(@post4.text)
    end

    it 'displays a button to see all users posts' do
      expect(page).to have_link 'See all posts'
    end

    it 'click on post title and re-directed to post show page' do
      click_link 'Hello 1'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end

    it 'click on see all posts button and re-directed to users posts index page' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
