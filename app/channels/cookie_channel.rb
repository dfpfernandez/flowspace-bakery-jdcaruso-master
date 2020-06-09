class CookieChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cookie_channel"
  end
end
