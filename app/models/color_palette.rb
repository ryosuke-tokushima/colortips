class ColorPalette < ApplicationRecord
    belongs_to :user
    has_many :posts
    has_many :color_palette_colors, dependent: :destroy
    has_many :colors, through: :color_palette_colors
end
