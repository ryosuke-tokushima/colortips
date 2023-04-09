class ChangeImagesToJsonbInPostsFixFix < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :images, 'jsonb USING images::jsonb'
  end

  def down
    change_column :posts, :images, 'json USING images::json'
  end
end
