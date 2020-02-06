class ChatChannel < ApplicationCable::Channel

  # calls connect on client-side
  def subscribed
    stream_from 'chat_channel'
  end

  # calls disconnect on client-side
  def unsubscribed
  end

  # will be executed when performed() is called on client-side
  def create(options)
    Message.create( content: options.fetch('content') )
  end

end