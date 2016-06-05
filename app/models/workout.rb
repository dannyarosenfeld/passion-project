class Workout < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :log



  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
