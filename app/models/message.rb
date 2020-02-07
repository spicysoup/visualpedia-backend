class Message < ApplicationRecord
  belongs_to :sender, class_name: :User, foreign_key: 'sender_id'
  
  after_create_commit do
    MessageCreationEventBroadcastJob.perform_later(self)
  end
end