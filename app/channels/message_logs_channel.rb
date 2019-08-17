class MessageLogsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'message_log_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    if (!data["body"].nil?)
      # Message.create(user_id: data["userId"], game_id: data["gameId"], body: data["body"])
      data["message"] = "#{data["sender"]}: #{data["body"]}"
    end
    ActionCable.server.broadcast('message_log_channel',data)
  end
end
