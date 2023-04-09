class ChangeJsonToJsonbInPostsFix < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :images, :jsonb, using: 'CAST(images AS jsonb)'
  end
end
