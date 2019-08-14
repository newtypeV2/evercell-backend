class CharacterGameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'character_game'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    playerInstance = CharacterGame.find(data["player"]["id"])
    playerInstance.update(x_coordinate:data["player"]["x_coordinate"] ,y_coordinate:data["player"]["y_coordinate"], direction: data["player"]["direction"])
      ActionCable.server.broadcast('character_game', data)
  end

end
