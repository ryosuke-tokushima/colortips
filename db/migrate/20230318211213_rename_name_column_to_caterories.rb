class RenameNameColumnToCaterories < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :name, :category_name
  end
end
