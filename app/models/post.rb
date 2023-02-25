class Post < ApplicationRecord
  mount_uploader :photo, ImageUploader
  belongs_to :user
  belongs_to :color_palette
  has_many_attached :images
end
