class MessageCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform( message )
    # puts '============================='
    # p chat_message
    
    # unless @current_user.present?
    #   puts "UNAUTHORISED CHAT!!!!!!!!!!!!!!!!!"
    #   return
    # end

    # payload = {
    #   content: message.content,
    #   created_at: message.created_at.strftime('%H:%M'),
    #   sender: message.user.name
    # }

    ActionCable
      .server
      .broadcast(
        'chat_channel',
        id: message.id,
        content: message.content,
        created_at: message.created_at.strftime('%H:%M'),
        sender: message.user.name
      )

  end
end