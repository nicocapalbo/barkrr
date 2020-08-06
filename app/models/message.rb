class Message < ApplicationRecord
  belongs_to :conversation, touch: true
  belongs_to :user

  validates_presence_of :content, :conversation_id, :user_id

  def message_time
    created_at.strftime("%l:%M%p")
  end

end
