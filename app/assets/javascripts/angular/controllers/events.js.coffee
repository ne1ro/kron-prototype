# Events controller
# Resource

# Events controller
@EventCtrl = ["$scope", "Event", ($scope, Event) ->
  # Event = $resource("/events/:id", {id: '@id'}, {update: {method: "PUT"}})
  # Event = $resource("/events")
  $scope.events = Event.query()

  $scope.addEntry = ->
    event = Event.save($scope.newEvent)
    $scope.events.push(event)
    $scope.newEvent = {}

  $scope.deleteEvent = (event, $index) ->
    Event.delete(id : event._id)
    $scope.events.splice($index,1)
]    