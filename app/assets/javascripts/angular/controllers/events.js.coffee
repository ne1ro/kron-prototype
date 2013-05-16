# Events controller
# Resource

# Events controller
@EventCtrl = ["$scope", "$filter", "Event", "Calendar", ($scope, $filter, Event, Calendar) ->
  $scope.events = Event.query()
  $scope.data = new Date()

  $scope.showNew = false
  $scope.showEdit = false

  $scope.showAddBox = ->
    if $scope.showEdit
      $scope.showEdit = false
    $scope.showNew = true

  $scope.showEditBox = ->
    if $scope.showNew
      $scope.showNew = false
    $scope.showEdit = true

  $scope.createEvent = ->
    event = Event.save($scope.newEvent)
    $scope.events.push(event)
    $scope.newEvent = {}

  $scope.showEvent = (event, $index) ->
    $scope.showEditBox()
    $scope.editEvent = Event.get(id : event._id)

  $scope.updateEvent = ->
    $scope.editEvent.$update(id : $scope.editEvent._id)
    $scope.events = Event.query()
    
  $scope.deleteEvent = (event, $index) ->
    Event.delete(id : event._id)
    $scope.events.splice($index,1)
]    