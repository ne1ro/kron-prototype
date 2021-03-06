# Events controller
# Resource

# Events controller
@EventCtrl = ["$scope", "$filter", "Event", "socket", ($scope, $filter, Event, socket) ->
  $scope.events = Event.query()
  $scope.data = new Date()
  $scope.newEvent = {}
  $scope.editEvent = {}

  socket.on 'notify', (data) ->
    $scope.notify = data
    $('#black').fadeIn 500
    $('#notify').slideDown 500

  $scope.createEvent = ->
    event = Event.save($scope.newEvent)
    socket.emit 'notify', event
    $scope.events.push(event)
    $scope.newEvent = {}

  $scope.showEvent = (event, $index) ->
    $scope.editEvent = Event.get(id : event._id)

  $scope.updateEvent = ->
    $scope.editEvent.$update(id : $scope.editEvent._id)
    socket.emit 'notify', $scope.editEvent
    $scope.events = Event.query()
    
  $scope.deleteEvent = (event, $index) ->
    Event.delete(id : event._id)
    $scope.events.splice($index,1)

  $scope.newDate = ->
    $scope.newEvent.time = new Date()
    $scope.month = $scope.newEvent.time.getMonth()
]    
