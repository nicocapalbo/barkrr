class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # The user (loged-in user) follows other users
  # 1) Retrive all the instances from the table Followings based on the loged-in user ID
  has_many :followed_users, foreign_key: :follower_id, class_name: "Following", dependent: :destroy

  # 2) Based on the array of intances in wich the loged-in user is the follower, retrieve all the instances of the followed Users in the Followings table by calling the 'followee' instance method
  has_many :followees, through: :followed_users, source: :followee

  # The user loged-in has many followers
  #  1) Retrieve all the instances from the Followings table based on the loge
  has_many :follower_users, foreign_key: :followed_id, class_name: "Following", dependent: :destroy

  # 2) Based on the array of instances from the loged-in user, retrieve all the ID of the users following the loged-in user.
  has_many :followers, through: :follower_users, source: :follower

  def follow(user)
    followed_users.create(followed_id: user.id)
  end

  def unfollow(user)
    followed_users.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followees.include?(user)
  end
end
