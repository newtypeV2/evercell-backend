class CharacterGameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'character_game'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # charactergame = Character.find(data[:id])
    ActionCable.server.broadcast('character_game', data)
  end

end
