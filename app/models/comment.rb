class Comment < ActiveRecord::Base
  # Remember to create a migration!

  has_many :likes, as: :likable
  belongs_to :user
  belongs_to :log

  def points
    likes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
