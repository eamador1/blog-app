class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }
  belongs_to :user
  belongs_to :post

  after_save :likes_counter_update

  def likes_counter_update
    post.update(likes_counter: post.likes.count)
  end
end
