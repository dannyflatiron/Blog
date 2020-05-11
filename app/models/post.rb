class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  validates :content, :title, presence: true
  validate :too_many_posts

  # Scope Methods

  # orders posts title alphabetically
  scope :organize, -> { order(:title)}

  # orders posts by most comments in descending order
  scope :most_comments, -> {left_joins(:comments).group('posts.id').order('count(posts.id) desc')}

  # custom validations
  def too_many_posts
    today_posts = user.posts.select do |p|
      p.created_at.try(:to_date) == Date.today
    end
     if today_posts.size > 1
      errors.add(:post_id, "can't post more than 2 times per day")
     end
  end
end
