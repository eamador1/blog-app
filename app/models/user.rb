class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts
end

  def three_recent_posts
      post.order(created_at: :desc).limit(3)
  end