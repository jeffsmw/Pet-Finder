class ConversationsController < ApplicationController

  def index
     @users = User.all
     @conversations = Conversation.all
   end

  def create
   if Conversation.between(params[:sender_id],params[:recipient_id]).present?
     @conversation = Conversation.between(params[:sender_id],
     params[:recipient_id]).first
   else
     @conversation = Conversation.create!(conversation_params)
   end
   respond_to do |format|
     format.json { render json: @conversation.to_json }
   end
  end

  private

   def conversation_params
    params.permit(:sender_id, :recipient_id)
   end

end
