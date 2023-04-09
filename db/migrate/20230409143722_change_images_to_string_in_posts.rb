class ChangeImagesToStringInPosts < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :images, :string
  end

  def down
    change_column :posts, :images, :text
  end
end
