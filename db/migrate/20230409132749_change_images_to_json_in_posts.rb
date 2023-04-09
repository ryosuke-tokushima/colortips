class ChangeImagesToJsonInPosts < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :images, :text
  end

  def down
    change_column :posts, :images, :json
  end
end
