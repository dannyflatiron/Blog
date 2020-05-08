Blog App

User Model 
    -has many posts
    -has many comments
    -has many commented posts through comments
    -has many categories through posts
    -attributes email:string username:string password_digest:string

Post Model
    -has many comments
    -attributes: title:string content:string
    -has many users through comments
    -belongs to a category

Comment Model
    -belongs to user
    -belongs to post
    -attributes: test:string 

Categories
    -attributes name:string
    -has_many posts
    -has many users through posts