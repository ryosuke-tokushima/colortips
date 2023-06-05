class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :color_palette
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarks, source: :user
  has_many :comments, dependent: :destroy

  attr_accessor :category_names

  validates :body, presence: true

  def save_category(sent_categories)
    categories.clear # 一旦現在のカテゴリを全て削除する
    sent_categories.each do |category_name|
      category = Category.find_or_create_by(category_name: category_name)
      categories << category unless categories.include?(category)
    end
  end
end
