class ChangeJsonToJsonbInPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :images, :jsonb, using: 'images::jsonb'
  end
end
