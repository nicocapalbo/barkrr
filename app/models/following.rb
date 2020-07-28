class Following < ApplicationRecord
  # The user that gets followed (loged in user)
  belongs_to :followee, foreign_key: :followed_id, class_name: "User"

  # The users following the loged-in  user
  belongs_to :follower, foreign_key: :follower_id, class_name: "User"

  validates :followed_id, presence: true
  validates :follower_id, presence: true
end
