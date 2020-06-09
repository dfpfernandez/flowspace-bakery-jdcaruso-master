App.oven = App.cable.subscriptions.create "OvenChannel",
  received: (data) ->
    $('.empty-oven').removeClass('hide');
