class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recepient, foreign_key: :recipient_id, class_name: "User"
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scopre: :recipient_id

  scope :between, -> (sender_id, recipient_id) {
    where("(conversations.sender_id = ? AND conversations.recepient_id = ?) OR ( conversations.recepient_id = ? AND conversations.sender_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  }
end
