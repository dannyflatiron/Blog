class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  # orders posts title alphabetically
  scope :organize, -> { order(:title)}

  # orders posts by most comments in descending order
  scope :most_comments, -> {joins(:comments).group('posts.id').order('count(posts.id) desc')}
end
