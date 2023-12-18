require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    let(:user) { User.create(name: 'Erwin Amador') }
    let(:post) { Post.create(title: 'I am tired', author: user) }
    it 'updates likes_counter' do
      Like.create(user:, post:)
      expect(post.reload.likes_counter).to eq(1)
    end
  end
end
