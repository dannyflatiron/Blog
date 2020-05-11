class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :commented_posts, through: :comments, source: :post, dependent: :destroy
    # has_many :categories, through :posts

    has_secure_password 
    #gives access to authenticate method, built in validations such as validate password, password confirmation

    def delete_user(user)
        # enable user to delete their account
        # how to find user?
        # scope method? pr findy_by?
        # user = User.find_by_id()
    end
end
