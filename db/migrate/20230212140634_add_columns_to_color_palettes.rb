class AddColumnsToColorPalettes < ActiveRecord::Migration[6.1]
  def change
    add_column :color_palettes, :closest_palette_color, :string
    add_column :color_palettes, :html_code, :string
  end
end
