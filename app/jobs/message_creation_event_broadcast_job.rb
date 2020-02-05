class MessageCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform( message )
    # puts '============================='
    # p chat_message
    
    # unless @current_user.present?
    #   puts "UNAUTHORISED CHAT!!!!!!!!!!!!!!!!!"
    #   return
    # end

    ActionCable
      .server
      .broadcast('chat_channel',
                id: message.id,
                created_at: message.created_at.strftime('%H:%M'),
                content: message.content)
  end
end