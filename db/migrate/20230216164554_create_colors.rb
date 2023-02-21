class CreateColors < ActiveRecord::Migration[6.1]
  def change
    create_table :colors do |t|
      t.string :closest_pallet_color
      t.string :closest_palette_color_html_code

      t.timestamps
    end
  end
end
