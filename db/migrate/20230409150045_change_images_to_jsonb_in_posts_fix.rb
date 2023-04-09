class ChangeImagesToJsonbInPostsFix < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :images, 'json USING images::json'
  end

  def down
    change_column :posts, :images, :string
  end
end
