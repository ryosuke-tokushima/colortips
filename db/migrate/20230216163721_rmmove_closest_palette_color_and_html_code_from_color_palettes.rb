class RmmoveClosestPaletteColorAndHtmlCodeFromColorPalettes < ActiveRecord::Migration[6.1]
  def change
    remove_column :color_palettes, :html_code, :string
    remove_column :color_palettes, :closest_palette_color, :string
  end
end
