require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Erwin Amador') }
  subject do
    Post.new(
      title: 'I am tired',
      text: 'Blah Blah Blah',
      comments_counter: 2,
      likes_counter: 1
    )
  end

  before { subject.save }
  it 'title should be present' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'should be 250 characters long or less' do
    subject.title = 'a' * 251
    expect(subject).not_to be_valid
  end

  it 'comments_counter greater or equal to zero' do
    subject.comments_counter = -8
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 1.1
    expect(subject).to_not be_valid
  end

  it 'likes_counter greater or equal to zero' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = 3.1416
    expect(subject).to_not be_valid
  end

  it 'shows the five most recent comments to the post' do
    random_post = Post.create(title: 'I am tired', author: user)

    first_comment = Comment.create(user:, post: random_post, text: 'hay', created_at: 8.days.ago)
    second_comment = Comment.create(user:, post: random_post, text: 'hey', created_at: 7.days.ago)
    third_comment = Comment.create(user:, post: random_post, text: 'hiy', created_at: 6.days.ago)
    fourth_comment = Comment.create(user:, post: random_post, text: 'hoy', created_at: 3.days.ago)
    fifth_comment = Comment.create(user:, post: random_post, text: 'huy', created_at: 2.days.ago)
    sixth_comment = Comment.create(user:, post: random_post, text: 'bay', created_at: 1.days.ago)

    recent_comments = random_post.reload.five_recent_comments

    expect(recent_comments.count).to eq(5)
    expect(recent_comments).to include(sixth_comment, fifth_comment, fourth_comment, third_comment, second_comment)
    expect(recent_comments).not_to include(first_comment)
  end

  it 'updates post_counter' do
    post = Post.create(title: 'I am tired', author: user)
    post.send(:update_posts_counter)
    expect(user.reload.post_counter).to eq(1)
  end
end
