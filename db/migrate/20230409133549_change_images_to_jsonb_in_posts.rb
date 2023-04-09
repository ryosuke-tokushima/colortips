class ChangeImagesToJsonbInPosts < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      ALTER TABLE posts
      ALTER COLUMN images
      SET DATA TYPE jsonb
      USING images::jsonb
    SQL
  end

  def down
    change_column :posts, :images, :text
  end
end
