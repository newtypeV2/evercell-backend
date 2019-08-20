class AnimationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'animation_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    byebug
    ActionCable.server.broadcast('animation_channel',data)
  end

end
