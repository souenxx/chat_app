class Message < ApplicationRecord
  belongs_to :user,optional: true
  #validates :user_id,presence: true
  validates :content,presence: true
  #after_create_commit { MessageBroadcastJob.perform_later self }
end
