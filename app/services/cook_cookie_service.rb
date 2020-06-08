class CookCookieService < ApplicationService
  attr_reader :cookie

  def initialize(cookie)
    @cookie = cookie
  end

  def call
    # TODO: (D. Fernandez): Do the cooking before status update
    cookie.update(status: Cookie.statuses[:ready])
  end
end
