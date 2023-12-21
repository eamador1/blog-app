require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) do
    User.create(name: 'John Doe')
  end

  describe 'GET /users' do
    before { get users_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'shows all users' do
      expect(response.body).to include '<h1>Users index</h1>'
    end

    it 'renders the index templete' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/user_id' do
    before { get user_path(user) }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'shows specific user' do
      expect(response.body).to include '<h1>Users show</h1>'
    end

    it 'renders the index templete' do
      expect(response).to render_template(:show)
    end
  end
end
