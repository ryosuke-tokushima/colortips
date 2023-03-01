class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :color_palette

  validates :body, presence: true
end
