# Events controller
# Resource

# Events controller
@EventCtrl = ["$scope", "$filter", "Event", "Calendar", ($scope, $filter, Event, Calendar) ->
  $scope.events = Event.query()
  $scope.data = new Date()
  $scope.newEvent = {}

  $scope.createEvent = ->
    event = Event.save($scope.newEvent)
    $scope.events.push(event)
    $scope.newEvent = {}

  $scope.showEvent = (event, $index) ->
    $scope.editEvent = Event.get(id : event._id)

  $scope.updateEvent = ->
    $scope.editEvent.$update(id : $scope.editEvent._id)
    $scope.events = Event.query()
    
  $scope.deleteEvent = (event, $index) ->
    Event.delete(id : event._id)
    $scope.events.splice($index,1)

  $scope.newDate = ->
    $scope.newEvent.time = new Date()
]    