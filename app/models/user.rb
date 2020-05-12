class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :commented_posts, through: :comments, source: :post, dependent: :destroy

    has_secure_password 

end
