class RoomChannel < ApplicationCable::Channel
  
  
  def subscribed
    #binding.pry
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create!(content: data['message'],user_id: current_user.id)
    template = ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
    ActionCable.server.broadcast 'room_channel', template
    #ActionCable.server.broadcast 'room_channel', {name: current_user.name, content: data['message']}
    #ActionCable.server.broadcast 'room_channel', message: data['message']
    #Message.create! content: data['message']
  end
  
end
