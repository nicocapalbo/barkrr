class MessagesController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @messages = Message.where("conversation_id = ?", params[:id])
  end
end
