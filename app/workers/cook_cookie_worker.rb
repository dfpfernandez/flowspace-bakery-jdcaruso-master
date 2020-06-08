class CookCookieWorker
  include Sidekiq::Worker
  sidekiq_options queue: :cookies

  def perform(cookie_id)
    cookie = Cookie.find_by(id: cookie_id)

    CookCookieService.call(cookie)
  end
end
