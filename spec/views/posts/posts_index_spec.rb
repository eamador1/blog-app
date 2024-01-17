requiere 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'post index page' do
    before do
        @user = User.create(name: 'FirstUser', post_counter: 3, photo: 'https://picsum.photos/100', bio: 'Swiftie')
        @post1 = Post.create(title: 'Hello 1', text: 'I am so glad to say hello 1', author_id: @user.id)
        @post2 = Post.create(title: 'Hello 2', text: 'I am so glad to say hello 2', author_id: @user.id)
        @post3 = Post.create(title: 'Hello 3', text: 'I am so glad to say hello 3', author_id: @user.id)
        @post4 = Post.create(title: 'Hello 4', text: 'I am so glad to say hello 4', author_id: @user.id)
  
        visit user_path(@user)
    end
  end

end