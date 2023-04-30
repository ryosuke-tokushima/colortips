class ColorPaletteColor < ApplicationRecord
  belongs_to :color_palette
  belongs_to :color
end
