class CharacterGameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'character_game'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    playerInstance = CharacterGame.find(data["id"])
    playerInstance.update(x_coordinate:data["x_coordinate"] ,y_coordinate:data["y_coordinate"], direction: data["direction"])
      ActionCable.server.broadcast('character_game', data)
  end

end
