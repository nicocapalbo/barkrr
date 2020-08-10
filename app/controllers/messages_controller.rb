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
        render_to_string(partial: "conversations/conv-messages", locals: { message: @message })
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
end
