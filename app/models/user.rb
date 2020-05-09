class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :commented_posts, through: :comments, source: :post
    # has_many :categories, through :posts

    has_secure_password 
    #gives access to authenticate method, built in validations such as validate password, password confirmation
end
