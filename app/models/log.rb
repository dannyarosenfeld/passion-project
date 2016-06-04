class Log < ActiveRecord::Base
  # Remember to create a migration!
  has_many :likes, as: :likable
  belongs_to :user
  has_many :comments

  def points
    likes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
