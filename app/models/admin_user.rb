class AdminUser < ApplicationRecord
    authenticates_with_sorcery!

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end