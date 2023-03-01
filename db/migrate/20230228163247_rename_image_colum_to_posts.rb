class RenameImageColumToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :image, :images
  end
end
