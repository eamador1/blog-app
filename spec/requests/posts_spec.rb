require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) do
    User.create(name: 'John Doe')
  end

  let(:post) do
    Post.create(title: 'Test Post', text: 'Lorem Ipsum', author: user)
  end

  describe 'GET /users/:user_id/posts' do
    before { get user_posts_path(user) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'shows correct placeholder text in the response body' do
      expect(response.body).to include('<h1>Posts Index</h1>')
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before { get user_post_path(user, post) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    
    it 'shows correct placeholder text in the response body' do
      expect(response.body).to include('<h1>Posts show</h1>')
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
