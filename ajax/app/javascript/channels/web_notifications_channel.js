// import consumer from "./consumer"
//
// consumer.subscriptions.create("WebNotificationsChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },
//
//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },
//
//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });

App.ajax = App.cable.subscriptions.create('WebNotificationsChannel', {
  received: function(data) {
    return $('#messages').append(this.renderSnippet(data));
  },
  // renderSnippet: function(data) {
  //   return "<p> <b>" + data.user.name + ": </b>" + data.snippet + "</p>";
  // }
});
