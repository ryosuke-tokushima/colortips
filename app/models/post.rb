class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :color_palette
  has_many :post_categories
  has_many :categories, through: :post_categories

  attr_accessor :category_names

  validates :body, presence: true

  def save_category(sent_categories)
    current_categories = self.categories.pluck(:category_name) unless self.categories.nil?
    old_categories = current_categories - sent_categories
    new_categories = sent_categories - current_categories

    old_categories.each do |old_category_name|
      self.categories.delete( Category.find_by(category_name: old_category_name))
    end

    new_categories.each do |new_category_name|
      new_post_category = Category.find_or_create_by(category_name: new_category_name)
      self.categories << new_post_category
    end
  end

end
