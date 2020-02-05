class AddConversationRefToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :chat_messages, :conversation, foreign_key: true
  end
end
