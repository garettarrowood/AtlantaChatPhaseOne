# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    Message.create!(content: data['message'])
    ActionCable.server.broadcast('chat_channel', { message: data['message'] })
  end
end
