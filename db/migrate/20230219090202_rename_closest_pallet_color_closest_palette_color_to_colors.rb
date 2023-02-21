class RenameClosestPalletColorClosestPaletteColorToColors < ActiveRecord::Migration[6.1]
  def change
    rename_column :colors, :closest_pallet_color, :closest_palette_color
  end
end
