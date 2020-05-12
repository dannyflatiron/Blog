class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  validates :content, :title, presence: true
  validate :too_many_posts

  scope :organize, -> { order(:title)}
  scope :most_comments, -> {joins(:comments).group('posts.id').order('count(posts.id) desc')}


  def self.search(params)
    left_joins(:comments).where("LOWER(posts.title) LIKE :term OR LOWER(posts.content) LIKE :term OR LOWER(comments.content) LIKE :term", term: "%#{params}%")
  end

  def too_many_posts
    today_posts = user.posts.select do |p|
      p.created_at.try(:to_date) == Date.today
    end
     if today_posts.size > 4
      errors.add(:post_id, "can't post more than 4 times per day")
     end
  end
end
