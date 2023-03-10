class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  has_many :color_palettes, dependent: :destroy
  has_many :posts

  validates :name, presence: true, length: { maximum: 255 }
  validates :password, length: { minimum: 3 }, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
end
