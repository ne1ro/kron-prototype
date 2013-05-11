# Events controller
# Resource

# Events controller
@EventCtrl = ["$scope", "Event", ($scope, Event) ->
  # Event = $resource("/events/:id", {id: '@id'}, {update: {method: "PUT"}})
  # Event = $resource("/events")
  $scope.events = Event.query()

  $scope.addEvent = ->
    event = Event.save($scope.newEvent)
    $scope.events.push(event)
    $scope.newEvent = {}

  $scope.showEvent = (event) ->
    $scope.editEvent = Event.get(id : event._id)

  $scope.updateEvent = ->
    

  $scope.deleteEvent = (event, $index) ->
    Event.delete(id : event._id)
    $scope.events.splice($index,1)
]    