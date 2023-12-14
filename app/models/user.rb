class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: 'author_id'
end

def three_recent_posts
  post.order(created_at: :desc).limit(3)
end
