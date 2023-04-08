class ChangeImagesColumnTypeInTable < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :images, :json, using: 'images::json'
  end
end
