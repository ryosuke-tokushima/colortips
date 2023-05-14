class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  enum role: { general: 0, admin: 1 }

  has_many :color_palettes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :bookmarks
  has_many :bookmarked_posts, through: :bookmarks, source: :post
  has_many :comments

  validates :name, presence: true, length: { maximum: 255 }
  validates :password, length: { minimum: 3 }, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true


  def bookmark(post)
    bookmarked_posts << post
  end

  def unbookmark(post)
    bookmarked_posts.destroy(post)
  end

  def bookmark?(post)
    bookmarked_posts.include?(post)
  end
end
