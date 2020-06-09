class OvenChannel < ApplicationCable::Channel
  def subscribed
    stream_from "oven_channel"
  end
end
