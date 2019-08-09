class PlayersChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'players_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    byebug
    # charactergame = Character.find(data[:id])
    # ActionCable.server.broadcast('CharacterGame', data)
  end

end


