App.cookie = App.cable.subscriptions.create "CookieChannel",
  received: (data) ->
    $('.cookie-info').html(data.cookie_info);
