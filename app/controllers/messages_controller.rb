class MessagesController < ApplicationController
  before_action :set_conversation, only: [ :show, :create ]

  # def show
  #   # @messages = Message.where("conversation_id = ?", params[:id])
  #   @messages = Message.find(params[:id])
  #   @message = Message.new
  #   raise
  # end

  def create
    @message.conversation = @conversation
    @message = Message.new(message_params)
    @messages.user = current_user

  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
