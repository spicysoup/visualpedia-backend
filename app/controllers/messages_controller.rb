class MessagesController < ApplicationController

  def index
    messages = Message.all

    respond_to do |format|
      format.json { render json: messages }
    end
  end

  def create
    message = Message.new( message_params )
    @sender = User.find( message_params[:sender_id] )

    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to conversation, serialized_data
      head :ok
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:content, :sender_id, @sender)
  end

end