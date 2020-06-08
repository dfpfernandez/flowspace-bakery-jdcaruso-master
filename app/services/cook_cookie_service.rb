class CookCookieService < ApplicationService
  attr_reader :cookie

  def initialize(cookie)
    @cookie = cookie
  end

  def call
    # TODO: (D. Fernandez): Do the cooking before status update
    cookie.update(status: Cookie.statuses[:ready])
    broadcast_cookie_ready
    broadcast_all_ready if cookie.storage.all_cookies_ready?
  end

  private

  def broadcast_all_ready
    ActionCable.server.broadcast('oven_channel', {})
  end

  def broadcast_cookie_ready
    ActionCable.server.broadcast('cookie_channel', { cookie_info: render_cookie_info, cookie_id: cookie.id })
  end

  def render_cookie_info
    ApplicationController.renderer.render(partial: 'ovens/cookie_info', locals: { cookie: cookie })
  end
end
