class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @sender = current_user.id
    @users = User.all
    @conversations = Conversation.where("(sender_id = ? OR recipient_id = ?)", current_user.id, current_user.id).order(updated_at: :desc)
    # raise
    @conversation = Conversation.new
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(created_at: :asc).last(20)
    @other_user = @conversation.other_user(current_user)
    @message = Message.new
  end

  def create
    # raise
    # @conversation = Conversation.between(params[:conversation][:sender], params[:conversation][:recipient_id]).first_or_create!(conversation_params)
    if Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).present?
      @conversation = Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    # raise
    redirect_to conversation_path(@conversation)
  end

  private

  def conversation_params
    # params[:conversation][:sender_id] = current_user
    params.require(:conversation).permit(:sender_id, :recipient_id)
  end
end
