class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast 'room_channel', my_message: render_my_message(message), other_message: render_other_message(message),chat_user: @arguments[0].user_id
    #ActionCable.server.broadcast 'room_channel', message: render_message(message),chat_user: @arguments[0].user_id
  end
  private

    def render_my_message(message)
      ApplicationController.renderer.render partial: 'messages/my_message', locals: { message: message }
    end
    
    def render_other_message(message)
      ApplicationController.renderer.render partial: 'messages/other_message', locals: { message: message }
    end
end
