class GameMonsterChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'game_monster'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast('game_monster',data)
  end
  
end
