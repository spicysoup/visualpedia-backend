class ChatMessageCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform( chat_message )
    # puts '============================='
    # p chat_message
    
    # unless @current_user.present?
    #   puts "UNAUTHORISED CHAT!!!!!!!!!!!!!!!!!"
    #   return
    # end

    ActionCable
      .server
      .broadcast('chat_channel',
                id: chat_message.id,
                created_at: chat_message.created_at.strftime('%H:%M'),
                content: chat_message.content)
  end
end