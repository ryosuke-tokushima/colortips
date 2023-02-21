class CreateColorPalettes < ActiveRecord::Migration[6.1]
  def change
    create_table :color_palettes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :color_palette_title, null: false
      
      t.timestamps
      
    end
  end
end
