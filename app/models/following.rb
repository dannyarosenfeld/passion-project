class Following < ActiveRecord::Base
  # Remember to create a migration!
 belongs_to :user
 belongs_to :followee, :class_name => 'User'
 belongs_to :follower, :class_name => 'User'
end
