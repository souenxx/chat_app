App.room = App.cable.subscriptions.create("RoomChannel", {
  /* global $ */
  connected: function() {
    //console.log('connected')
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    //メッセージを受け取った時
    var show_user;
    show_user=$('#show_user').data('show_user');
    //const messages = document.getElementById('messages')
    //messages.innerHTML += message
    // Called when there's incoming data on the websocket for this channel
    if (data['chat_user']==show_user){
      return $('#messages').append(data['my_message']);  
    }else{
      return $('#messages').append(data['other_message']);
    }
    //return $('#messages').append(data['message']);
  },

  speak: function(message) {
    //メッセージが送信された時
    return this.perform('speak',{message:message});
  }
});


$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {
    App.room.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});
