class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :color_palette
  has_many :post_categories
  has_many :categories, through: :post_categories

  attr_accessor :category_names

  validates :body, presence: true
end
