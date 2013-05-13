# Events controller
# Resource

# Events controller
@EventCtrl = ["$scope", "$filter", "Event", ($scope, $filter, Event) ->
  $scope.events = Event.query()
  $scope.data = new Date()
  $scope.showAddBox = false;
  $scope.showEditBox = false;

  $scope.addEvent = ->
    event = Event.save($scope.newEvent)
    $scope.events.push(event)
    $scope.newEvent = {}

  $scope.showEvent = (event, $index) ->
    $scope.showEditBox = true
    $scope.editEvent = Event.get(id : event._id)

  $scope.updateEvent = ->
    $scope.editEvent.$update(id : $scope.editEvent._id)
    $scope.events = Event.query()
    
  $scope.deleteEvent = (event, $index) ->
    Event.delete(id : event._id)
    $scope.events.splice($index,1)
]    