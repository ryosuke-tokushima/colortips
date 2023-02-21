class CreateColorPaletteColors < ActiveRecord::Migration[6.1]
  def change
    create_table :color_palette_colors do |t|
      t.references :color_palette, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
