class MessagesController < ApplicationController
  before_action :set_conversation, only: [ :show, :create ]

  # def show
  #   # @messages = Message.where("conversation_id = ?", params[:id])
  #   @messages = Message.find(params[:id])
  #   @message = Message.new
  #   raise
  # end

  def create
    # @message.conversation = @conversation
    # @message = Message.new(message_params)
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        user_is_author_partial: render_message(@message),
        user_is_not_author: render_not_message(@message),
        message_author: @message.user.id
      )
      redirect_to conversation_path(@conversation, anchor: "message-#{@message.id}")
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    render_to_string(partial: "conversations/conv-messages", locals: { message: @message, other_user: @conversation.other_user(current_user), user_is_author: true })
  end

  def render_not_message(message)
    render_to_string(partial: "conversations/conv-messages", locals: { message: @message, other_user: @conversation.other_user(current_user), user_is_author: false })
  end
end
