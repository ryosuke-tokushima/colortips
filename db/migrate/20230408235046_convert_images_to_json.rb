class ConvertImagesToJson < ActiveRecord::Migration[6.1]
  def up
    Post.all.each do |post|
      post.update(images: JSON.parse(post.images))
    end
  end

  def down
    Post.all.each do |post|
      post.update(images: post.images.to_json)
    end
  end
end
