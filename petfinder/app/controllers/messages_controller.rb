class MessagesController < ApplicationController

  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end
  before_action :find_message, only: [:edit, :update, :destroy, :show]

  def index
   @messages = @conversation.messages
   respond_to do |format|
     format.json { render json: @messages.to_json }
   end
  end

  def show
    respond_to do |format|
      format.json { render json: @message.to_json }
    end
  end

  def new
   @message = @conversation.messages.new
  end

  def create
   @message = @conversation.messages.new(message_params)
   if @message.save
     respond_to do |format|
       format.json { render json: @message.to_json }
     end
   end
  end

  def destroy
    @message.destroy
  end

  private

  def message_params
   params.require(:message).permit(:title, :body, :user_id)
  end

  def find_message
    @message = Message.find params[:id]
  end

end
