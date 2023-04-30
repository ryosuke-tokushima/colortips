class ColorPalette < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :color_palette_colors, dependent: :destroy
  has_many :colors, through: :color_palette_colors, dependent: :destroy
  validates :color_palette_title, presence: true
end
