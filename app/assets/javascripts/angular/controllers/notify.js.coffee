# Notifications controller
@NotifyCtrl = ($scope, socket) ->
  # On message notify
  socket.on 'notify:send', (data) ->
    $scope.notify = data
    $('#black').fadeIn 500
    $('#notify').slideDown 500
    audioElement = document.createElement("audio")
    audioElement.setAttribute "src", "/notification.wav"
    audioElement.setAttribute "autoplay", "autoplay"
    $.get()
    audioElement.addEventListener "load", (->
      audioElement.play()
    ), true
  
