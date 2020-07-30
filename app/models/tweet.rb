class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def total_favs
    fav_counter = 0

    if favorites.empty?
      return fav_counter
      # fav_counter = 0
    else
      fav_counter = favorites.count
    end

    return fav_counter
  end

end
