class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast 'room_channel',message: render_message(message)
  end
  
  def render_message(message)
    ApplicationController.renderer.render partial: 'message/message', local:{message: message}
  end
end