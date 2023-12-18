require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', photo: 'www.miocroverse.com', bio: 'Blah Blah Blah', post_counter: 10) }

  before { subject.save }
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter greater or equal to zero' do
    subject.post_counter = -5
    expect(subject).to_not be_valid
  end

  it 'post_counter should be an integer' do
    subject.post_counter = 3.4
    expect(subject).to_not be_valid
  end

  it 'shows the user three most recent posts' do
    first_user = User.create(name: 'John Doe', photo: 'www.example.com', bio: 'Blah Blah Blah')

    first_post = Post.create(title: 'hay', author: first_user, created_at: 2.days.ago)
    second_post = Post.create(title: 'hey', author: first_user, created_at: 1.days.ago)
    third_post = Post.create(title: 'hoy', author: first_user, created_at: 3.minutes.ago)
    fourth_post = Post.create(title: 'huy', author: first_user, created_at: 1.minute.ago)

    recent_posts = first_user.three_recent_posts

    expect(recent_posts.count).to eq(3)
    expect(recent_posts).to include(fourth_post, third_post, second_post)
    expect(recent_posts).not_to include(first_post)
  end
end
