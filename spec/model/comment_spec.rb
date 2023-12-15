require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    let(:user) { User.create(name: 'Erwin Amador') }
    let(:post) { Post.create(title: 'I am tired', author: user) }
    it 'updates comments_counter' do
      Comment.create(user:, post:, text: 'Blah Blah Blsh')
      # post.reload send(:update_comments_counter)
      expect(post.reload.comments_counter).to eq(1)
    end
  end
end
