App.ajax = App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    $('#messages').append ("<div>" + data + "</div>")
