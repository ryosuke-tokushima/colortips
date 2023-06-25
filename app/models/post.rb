class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :color_palette
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarks, source: :user
  has_many :comments, dependent: :destroy
  validates :color_palette_id, presence: { message: 'カラーパレットを選択してください' }
  validates :images, presence: { message: '画像を選択してください' }

  attr_accessor :category_names

  validates :body, presence: true

  def save_category(sent_categories)
    categories.clear # 一旦現在のカテゴリを全て削除する
    sent_categories.each do |category_name|
      category = Category.find_or_create_by(category_name: category_name)
      categories << category unless categories.include?(category)
    end
  end

  def selected_colors
    self.color_palette.color_palette_colors.sample(2).map(&:color)
  end

  
  def recommended_posts
    Post.joins(color_palette: :color_palette_colors)
        .where(color_palette_colors: { color_id: self.selected_colors.map(&:id) })
        .where.not(id: self.id)
        .distinct
  end
  
end
