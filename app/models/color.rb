class Color < ApplicationRecord
    has_many :color_palette_colors, dependent: :destroy
    has_many :color_palettes, through: :color_palette_colors
end
