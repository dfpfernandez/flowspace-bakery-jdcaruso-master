class CookCookieService < ApplicationService
  attr_reader :cookie

  def initialize(cookie)
    @cookie = cookie
  end

  def call
    # TODO: (D. Fernandez): Do the cooking before status update
    cookie.update(status: Cookie.statuses[:ready])

    ActionCable.server.broadcast('cookie_channel', { cookie_info: render_cookie_info(cookie) })
  end

  private

  def render_cookie_info(cookie)
    ApplicationController.renderer.render(partial: 'ovens/cookie_info', locals: { oven: cookie.storage })
  end
end
