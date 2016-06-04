class Like < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :likable, polymorphic: true
  belongs_to :user
end
