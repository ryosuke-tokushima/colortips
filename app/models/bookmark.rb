class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id }

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user)
  end
end
