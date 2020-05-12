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
  # how to show posts with zero comments?
  scope :most_comments, -> {joins(:comments).group('posts.id').order('count(posts.id) desc')}

  # searches database
  # select any posts with a title that is an exact match to the search term
  # select posts that match search params to titles
  # select posts with content that matches params with content
  # select posts that match params with comments
  def self.search(params)
    left_joins(:comments).where("LOWER(posts.title) LIKE :term OR LOWER(posts.content) LIKE :term OR LOWER(comments.content) LIKE :term", term: "%#{params}%")
  end

  # custom validations
  # limits amount of posts/day
  def too_many_posts
    today_posts = user.posts.select do |p|
      p.created_at.try(:to_date) == Date.today
    end
     if today_posts.size > 4
      errors.add(:post_id, "can't post more than 4 times per day")
     end
  end
end
