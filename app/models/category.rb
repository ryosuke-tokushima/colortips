class Category < ApplicationRecord
    has_many :post_categories, foreign_key: :category_id, dependent: :destroy
    has_many :posts,through: :post_categories, dependent: :destroy

    validates :category_name, presence: true, uniqueness: { case_sensitive: false }
end
